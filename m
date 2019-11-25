Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4387F7B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:23:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id f7so6908012pjw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:thread-index
	:content-language;
	bh=/AskCbMdrmBhfiyFzR36dsHQz6xjJTRxvtefe0+86n4=;
	b=iZhtCC4cyRtM2Uqw0ijzdlL61Kh/9lFzouRqgvEx6wujqwGzwW+gjcfHsxN6pYUeVu
	J1fNWO3glX7p+0l0pVcQ9BL+DYy/Os5MPG6KhxJeLmrbDo7stRSQbWhc256ow6xF4oJP
	w7F1vWoM+iwrYsXGq3QzyOTff93/LDFrS5DZvdEyyA95yEBgJOTlTJMJV0u5XHQ43MyL
	QFRY8yOEzwc6Vg2t/Z+SS8nDaBZBuU3irVqVF3rQKi/2RSM6LJhmcwS/QYN6VpFOf41N
	8bFnr/sVqts9X8163CEUWy0ufDxygSfAlcLcEyYO7WmGSWABDMw/lKg7+ZC4T3QELb4P
	9rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:thread-index:content-language;
	bh=/AskCbMdrmBhfiyFzR36dsHQz6xjJTRxvtefe0+86n4=;
	b=NkwQjH5ENvhUthWyDKFop/5auCoJUT0n+EKQiUyysLn/LP1iV4fYdHkENnfexCC1mu
	h3ST+Whm2/NszVpKejGMNYXG54rlIdgGw24pdmkCInLjlNoLDvyfXgXR8xdi7J9C86CE
	LoGukFXM/Vsj7AzMkrPHDLW6wIor6UA5u0Zk8Yh2cqyJW9PUBfoG8CqV4le2/xOq4DOt
	+umihduX6tMslmzr/KCyB1f/ImQpwYJMi8KgYSyBumDBZJXNjM4rb6+l1RMOcIMhBhCc
	422b/3EECe5hGqxuY05FFJchWeVmETw7GIk+6ZdxiGr8q9hQczuBsaV59Bk4mBxgHonj
	VwrQ==
X-Gm-Message-State: APjAAAWp/PtEk8dRiVsVWWlWMgQbE/o+rmsSrc+A+AzLYAQHHJlX7+SZ
	PoFamgFDzXrCIVZMy7A8snXsQw0x
X-Google-Smtp-Source: APXvYqxvW7g7YL7keTGmzqu6KUYrioe7LGbsNItG928ZeDk3qJr9zYH1ldno2t6XWZFbyqwHBNRu5A==
X-Received: by 2002:a17:90a:23a9:: with SMTP id
	g38mr17045586pje.128.1574702637009; 
	Mon, 25 Nov 2019 09:23:57 -0800 (PST)
Received: from sjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
	by smtp.gmail.com with ESMTPSA id
	q4sm9297636pgp.30.2019.11.25.09.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Nov 2019 09:23:56 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2019 09:23:55 -0800
Message-ID: <049501d5a3b5$1e244840$5a6cd8c0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIvBQzUlUAZpfCyR+oWKgHUZ9jYfQ==
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 17:23:56 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0496_01D5A372.100267D0"
Content-Language: en-us

------=_NextPart_000_0496_01D5A372.100267D0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

All,

=20

The triage team is starting to try and collect up and classify bugs =
which a newcomer to the project would be able to work on in a way which =
means people can find them. They're being listed on the triage page =
under the appropriate heading:

=20

 <https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs> =
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs

=20

The idea is these bugs should be straight forward for a person to help =
work on who doesn't have deep experience with the project.  If anyone =
can help, please take ownership of the bug and send patches!  If anyone =
needs help/advice there are people on irc who can likely do so, or some =
of the more experienced contributors will likely be happy to help too.

=20

Also, the triage team meets weekly and does its best to handle the bugs =
reported into the Bugzilla. The number of people attending that meeting =
has fallen, as have the number of people available to help fix bugs. One =
of the things we hear users report is they don't know how to help. We =
(the triage team) are therefore going to start reporting out the =
currently 295 unassigned or newcomer bugs.

=20

We're hoping people may be able to spare some time now and again to help =
out with these.  Bugs are split into two types, "true bugs" where things =
don't work as they should and "enhancements" which are features we'd =
want to add to the system.  There are also roughly four different =
"priority" classes right now, =E2=80=9C3.1=E2=80=9D, =E2=80=9C3.2, =
"3.99" and "Future", the more pressing/urgent issues being in "3.1" and =
then =E2=80=9C3.2=E2=80=9D.

=20

Please review this link and if a bug is something you would be able to =
help with either take ownership of the bug, or send me ( =
<mailto:sjolley.yp.pm@gmail.com> sjolley.yp.pm@gmail.com) an e-mail with =
the bug number you would like and I will assign it to you (please make =
sure you have a Bugzilla account).  The list is at:  =
<https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newcomer_Bug=
s> =
https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newcomer_Bugs=


=20

Thanks,

Stephen K. Jolley

Yocto Project Program Manager

7867 SW Bayberry Dr., Beaverton, OR 97007

*    Cell:                (208) 244-4460

* Email:                 s <mailto:stephen.k.jolley@intel.com> =
jolley.yp.pm@gmail.com <mailto:jolley.yp.pm@gmail.com>=20


------=_NextPart_000_0496_01D5A372.100267D0
Content-Type: text/html;
	boundary="----=_NextPart_000_01DF_01D59DF6.EAF8FEC0";
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p =
class=3DMsoNormal>All,<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal>The triage =
team is starting to try and collect up and classify bugs which a =
newcomer to the project would be able to work on in a way which means =
people can find them. They're being listed on the triage page under the =
appropriate heading:<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs"><spa=
n style=3D'font-family:"Times New =
Roman",serif;color:#0563C1'>https://wiki.yoctoproject.org/wiki/Bug_Triage=
#Newcomer_Bugs</span></a><o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal>The idea is =
these bugs should be straight forward for a person to help work on who =
doesn't have deep experience with the project.&nbsp; If anyone can help, =
please take ownership of the bug and send patches!&nbsp; If anyone needs =
help/advice there are people on irc who can likely do so, or some of the =
more experienced contributors will likely be happy to help =
too.<o:p></o:p></p><p class=3DMsoNormal>&nbsp;<o:p></o:p></p><p =
class=3DMsoNormal>Also, the triage team meets weekly and does its best =
to handle the bugs reported into the Bugzilla. The number of people =
attending that meeting has fallen, as have the number of people =
available to help fix bugs. One of the things we hear users report is =
they don't know how to help. We (the triage team) are therefore going to =
start reporting out the currently 295 unassigned or newcomer =
bugs.<o:p></o:p></p><p class=3DMsoNormal>&nbsp;<o:p></o:p></p><p =
class=3DMsoNormal>We're hoping people may be able to spare some time now =
and again to help out with these.&nbsp; Bugs are split into two types, =
&quot;true bugs&quot; where things don't work as they should and =
&quot;enhancements&quot; which are features we'd want to add to the =
system.&nbsp; There are also roughly four different &quot;priority&quot; =
classes right now, =E2=80=9C3.1=E2=80=9D, =E2=80=9C3.2, &quot;3.99&quot; =
and &quot;Future&quot;, the more pressing/urgent issues being in =
&quot;3.1&quot; and then =E2=80=9C3.2=E2=80=9D.<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal>Please =
review this link and if a bug is something you would be able to help =
with either take ownership of the bug, or send me (<a =
href=3D"mailto:sjolley.yp.pm@gmail.com"><span =
style=3D'font-family:"Times New =
Roman",serif;color:#0563C1'>sjolley.yp.pm@gmail.com</span></a>) an =
e-mail with the bug number you would like and I will assign it to you =
(please make sure you have a Bugzilla account).&nbsp; The list is at: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Unassigned_or_Newco=
mer_Bugs"><span =
style=3D'color:windowtext;text-decoration:none'>https://wiki.yoctoproject=
.org/wiki/Bug_Triage#Unassigned_or_Newcomer_Bugs</span></a><o:p></o:p></p=
><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><div><div><div><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b><i><span =
style=3D'font-size:16.0pt;color:purple'>Stephen K. =
Jolley</span></i></b><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;background-im=
age:initial;background-position:initial;background-repeat:initial'><b><sp=
an style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager</span></b><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;background-im=
age:initial;background-position:initial;background-repeat:initial'><b><sp=
an style=3D'font-family:"Courier New";color:fuchsia'>7867 SW Bayberry =
Dr., Beaverton, OR 97007</span></b><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;background-im=
age:initial;background-position:initial;background-repeat:initial'><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460</span><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;background-im=
age:initial;background-position:initial;background-repeat:initial'><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>*</span><span =
style=3D'font-size:9.0pt'>&nbsp;</span><b><span lang=3DFR =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:#1155CC'><a =
href=3D"mailto:stephen.k.jolley@intel.com" target=3D"_blank">s</a><a =
href=3D"mailto:jolley.yp.pm@gmail.com" =
target=3D"_blank">jolley.yp.pm@gmail.com</a></span></u></span><o:p></o:p>=
</p></div></div></div></div></div></body></html>

------=_NextPart_000_0496_01D5A372.100267D0--
