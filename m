Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web11.8199.1593775308326761624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=YPjKJECk;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend4 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id 4E3ED61B2E;
	Fri,  3 Jul 2020 13:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1593775305;
	bh=/S1j0kZTjGlsAwg9sDPXrCkEOqXa0+KQZ9cfEW13aIQ=;
	h=In-Reply-To:From:To:Date:Subject:MIME-Version:Content-type;
	b=YPjKJECkJiB4178vrEJAgwAHCl2Y04dpc5NI1vmDzGW7cHXlpf9tozOPX/O+6wO66
	 G+BDmTiWuGhIvEC82lsm0gt3yx4SakFVzsKDV2osf/HUfzh6Pq8dQwIkDp5peoXhqZ
	 RW0LDOEagqBVcuRni0paavKrRSNMTu7vXdGLJAEk=
In-Reply-To: <ae711e47aeeba494162c6fe7538d589c312c7ad0.camel@linuxfoundation.org>
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,	
   openembedded-core@lists.openembedded.org
CC: "Timon Ulrich" <t.ulrich@anapur.de>
Message-ID: <1fa90cea2f584515afcc89578e5808bb@kabelmail.de>
Date: Fri, 03 Jul 2020 13:21:43 +0200
X-Priority: 3
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add lz4 dependency and fixthe call to lz4
MIME-Version: 1.0
Content-type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family: arial,helvetica,san=
s-serif; font-size: 12px;"><title></title><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG></o:AllowPNG>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves></w:TrackMoves>
  <w:TrackFormatting></w:TrackFormatting>
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:PunctuationKerning></w:PunctuationKerning>
  <w:ValidateAgainstSchemas></w:ValidateAgainstSchemas>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF></w:DoNotPromoteQF>
  <w:LidThemeOther>DE</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables></w:BreakWrappedTables>
   <w:SnapToGridInCell></w:SnapToGridInCell>
   <w:WrapTextWithPunct></w:WrapTextWithPunct>
   <w:UseAsianBreakRules></w:UseAsianBreakRules>
   <w:DontGrowAutofit></w:DontGrowAutofit>
   <w:SplitPgBreakAndParaMark></w:SplitPgBreakAndParaMark>
   <w:EnableOpenTypeKerning></w:EnableOpenTypeKerning>
   <w:DontFlipMirrorIndents></w:DontFlipMirrorIndents>
   <w:OverrideTableStyleHps></w:OverrideTableStyleHps>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser></w:DoNotOptimizeForBrowser>
  <m:mathPr>
   <m:mathFont m:val=3D"Cambria Math"></m:mathFont>
   <m:brkBin m:val=3D"before"></m:brkBin>
   <m:brkBinSub m:val=3D"&#45;-"></m:brkBinSub>
   <m:smallFrac m:val=3D"off"></m:smallFrac>
   <m:dispDef></m:dispDef>
   <m:lMargin m:val=3D"0"></m:lMargin>
   <m:rMargin m:val=3D"0"></m:rMargin>
   <m:defJc m:val=3D"centerGroup"></m:defJc>
   <m:wrapIndent m:val=3D"1440"></m:wrapIndent>
   <m:intLim m:val=3D"subSup"></m:intLim>
   <m:naryLim m:val=3D"undOvr"></m:naryLim>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false"
  DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99"
  LatentStyleCount=3D"376">
  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=
=3D"Normal"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=
=3D"heading 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"></w:LsdE=
xception>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 6"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 7"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 8"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index 9"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 7"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 8"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 9"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Normal Indent"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"footnote text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"annotation text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"header"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"footer"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"index heading"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"></w:LsdExc=
eption>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"table of figures"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"envelope address"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"envelope return"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"footnote reference"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"annotation reference"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"line number"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"page number"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"endnote reference"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"endnote text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"table of authorities"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"macro"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"toa heading"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Bullet"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Number"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Bullet 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Bullet 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Bullet 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Bullet 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Number 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Number 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Number 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Number 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" Nam=
e=3D"Title"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Closing"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Signature"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"></w:LsdExcep=
tion>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text Indent"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Continue"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Continue 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Continue 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Continue 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"List Continue 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Message Header"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Nam=
e=3D"Subtitle"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Salutation"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Date"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text First Indent"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text First Indent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Note Heading"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text Indent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Body Text Indent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Block Text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Hyperlink"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"FollowedHyperlink"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" Nam=
e=3D"Strong"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" Nam=
e=3D"Emphasis"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Document Map"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Plain Text"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"E-mail Signature"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Top of Form"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Bottom of Form"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Normal (Web)"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Acronym"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Address"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Cite"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Code"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Definition"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Keyboard"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Preformatted"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Sample"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Typewriter"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"HTML Variable"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Normal Table"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"annotation subject"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"No List"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Outline List 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Outline List 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Outline List 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Simple 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Simple 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Simple 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Classic 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Classic 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Classic 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Classic 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Colorful 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Colorful 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Colorful 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Columns 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Columns 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Columns 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Columns 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Columns 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 6"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 7"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Grid 8"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 4"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 5"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 6"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 7"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table List 8"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table 3D effects 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table 3D effects 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table 3D effects 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Contemporary"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Elegant"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Professional"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Subtle 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Subtle 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Web 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Web 2"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Web 3"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Balloon Text"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid">=
</w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Table Theme"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placehol=
der Text"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=
=3D"No Spacing"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List">=
</w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid">=
</w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"><=
/w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true"
   Name=3D"List Paragraph"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Nam=
e=3D"Quote"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true"
   Name=3D"Intense Quote"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List A=
ccent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid A=
ccent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shadi=
ng 2 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Ac=
cent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful Lis=
t Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true"
   Name=3D"Subtle Emphasis"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true"
   Name=3D"Intense Emphasis"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true"
   Name=3D"Subtle Reference"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true"
   Name=3D"Intense Reference"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Nam=
e=3D"Book Title"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Bibliography"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"></w:Ls=
dException>
  <w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table =
1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table =
2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table =
4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table L=
ight"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1=
 Light"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6=
 Colorful"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7=
 Colorful"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1=
 Light"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6=
 Colorful"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7=
 Colorful"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 1"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 2"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 3"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 4"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 5"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4=
 Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 6"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Mention"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Smart Hyperlink"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Hashtag"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Unresolved Mention"></w:LsdException>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D=
"true"
   Name=3D"Smart Link"></w:LsdException>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table=2EMsoNormalTable
=09{mso-style-name:"Normale Tabelle";
=09mso-tstyle-rowband-size:0;
=09mso-tstyle-colband-size:0;
=09mso-style-noshow:yes;
=09mso-style-priority:99;
=09mso-style-parent:"";
=09mso-padding-alt:0cm 5=2E4pt 0cm 5=2E4pt;
=09mso-para-margin:0cm;
=09mso-para-margin-bottom:=2E0001pt;
=09mso-pagination:widow-orphan;
=09font-size:11=2E0pt;
=09font-family:"Calibri",sans-serif;
=09mso-ascii-font-family:Calibri;
=09mso-ascii-theme-font:minor-latin;
=09mso-hansi-font-family:Calibri;
=09mso-hansi-theme-font:minor-latin;
=09mso-bidi-font-family:"Times New Roman";
=09mso-bidi-theme-font:minor-bidi;
=09mso-fareast-language:EN-US;}
</style>
<![endif]--><p class=3D"MsoPlainText">&gt; Is there a way we can tell w=
hich compression format is being<br>&gt; used for the initramfs and mak=
e the dependencies conditional?</p><p class=3D"MsoPlainText">Checking w=
hether INITRAMFS_FSTYPES contains 'cpio=2Elz4' might do the trick=2E<br=
>I'll see into it and prepare a V2=2E</p>&nbsp;<div class=3D"replyHeade=
r" style=3D"background-color:#f9f9f9;line-height:20px;padding:5px;borde=
r-top:1px solid #dfdfdf;"><b style=3D"width:80px;display:inline-block;f=
ont-size:95%;">Von:</b> Richard Purdie &lt;richard=2Epurdie@linuxfounda=
tion=2Eorg&gt;<br><b style=3D"width:80px;display:inline-block;font-size=
:95%;">Gesendet:</b> 03=2E07=2E2020 12:42<br><b style=3D"width:80px;dis=
play:inline-block;font-size:95%;">An:</b> T=2E Ulrich &lt;timon=2Eulric=
h@kabelmail=2Ede&gt;,&lt;openembedded-core@lists=2Eopenembedded=2Eorg&g=
t;<br><b style=3D"width:80px;display:inline-block;font-size:95%;">Kopie=
:</b> Timon Ulrich &lt;t=2Eulrich@anapur=2Ede&gt;<br><b style=3D"width:=
80px;display:inline-block;font-size:95%;">Betreff:</b> Re: [OE-core] [P=
ATCH] kernel=2Ebbclass: add lz4 dependency and fixthe call to lz4</div>=
&nbsp;<div>On Fri, 2020-07-03 at 08:22 +0200, T=2E Ulrich wrote:<br>&gt=
; From: Timon Ulrich &lt;<a href=3D"mailto:t=2Eulrich@anapur=2Ede">t=2E=
ulrich@anapur=2Ede</a>&gt;<br>&gt;<br>&gt; If the initramfs image is ty=
pe lz4, then a native lz4 is needed=2E<br>&gt;<br>&gt; Additionally an =
output <a title=3D"filename" target=3D"_blank" href=3D"filename">filena=
me</a> needs to be specified when calling<br>&gt; lz4, otherwise STDOUT=
 will be used implicitly=2E<br>&gt;<br>&gt; Signed-off-by: Timon Ulrich=
 &lt;<a href=3D"mailto:t=2Eulrich@anapur=2Ede">t=2Eulrich@anapur=2Ede</=
a>&gt;<br>&gt; ---<br>&gt; meta/classes/kernel=2Ebbclass | 4 ++--<br>&g=
t; 1 file changed, 2 insertions(+), 2 deletions(-)<br><br>I really don'=
t like building tools just because we might need them=2E Is<br>there a =
way we can tell which compression format is being used for the<br>initr=
amfs and make the dependencies conditional?<br><br>Cheers,<br><br>Richa=
rd</div></div></body></html>

