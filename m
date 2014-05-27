Return-Path: <john.carter@taitradio.com>
X-Greylist: delayed 1194 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 02:16:26 UTC
Received: from mail-ob0-f170.google.com (unknown [209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 740F465FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:16:26 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uy5so8726400obc.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=l1AF/P/waCqp74sYQrqXkFp4aFmX7FSlnzaQ34oK47g=;
	b=mDCnvU1fH99OMWe/KxyY5TXFsapCtJpVJH3hNMmX78jgmDFxF7cLy2ENU6e8I6D7Xw
	LZDNZE1NCI97rilkBBnJrWzh8cRC3plVLHBXPw6DwqPH5XJKJHyDFjXv5004EyufsOV2
	OAIlTubVRAtVtzFVODTVTzR6240Cp7rrLJNbKaklGmZ7F6dtV23daBW9CiAl9OVxug46
	gElaukt+ZxxoGIaa1nTVbtPrJkAzONUfpYqCLNJAB3CPeHswTu/hIyoJzjgls4hDSA4l
	/oiE78o3MK4Vd+6w2yWnLenxj47Kl/TsXDQYS0NRz2vRxr90cU2PnJoaAPrDLVveYzq2
	IBFA==
X-Gm-Message-State: ALoCoQkhk0l2BTYIYFSx1Uee8sDDovvM+aOmTexAJYlBj5pqbDRVnm3j6+Eq9661CORXLkw448V9FeC9xQtsgSDhlT8n6ZDZuyI+2vjdAcaD1royG0UHCKvvx4QoU5+bER9JDKCsBNpc
X-Received: by 10.60.149.233 with SMTP id ud9mr29000237oeb.66.1401155356231;
	Mon, 26 May 2014 18:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.84.194 with HTTP; Mon, 26 May 2014 18:48:55 -0700 (PDT)
From: John Carter <john.carter@taitradio.com>
Date: Tue, 27 May 2014 13:48:55 +1200
Message-ID: <CAFD1m3E1vFuF6ZdsiL+RftJXxhSxnhb29BkTuz+XzcigYk5F1g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: core-image-lsb-dev missing required distro feature ['pam'] (not in DISTRO_FEATURES)
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
X-List-Received-Date: Tue, 27 May 2014 02:16:27 -0000
Content-Type: multipart/alternative; boundary=047d7b41c0cc489f8504fa57e724

--047d7b41c0cc489f8504fa57e724
Content-Type: text/plain; charset=UTF-8

OpenEmbedded newbie here.

I'm attempting to build a headless (no ui) device with sshd, so
core-image-lsb-dev seem to have more or less what I wanted.

But building results in....

bitbake core-image-lsb-dev
> Loading cache: 100%
> |############################################################################################################################################################################|
> ETA:  00:00:00
> Loaded 1219 entries from dependency cache.
> Parsing recipes: 100%
> |##########################################################################################################################################################################|
> Time: 00:00:15
> Parsing of 859 .bb files complete (0 cached, 859 parsed). 1218 targets, 38
> skipped, 0 masked, 0 errors.
> ERROR: Nothing PROVIDES 'core-image-lsb-dev'
> ERROR: core-image-lsb-dev was skipped: missing required distro feature
> ['pam'] (not in DISTRO_FEATURES)
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>

I get the same problem whether on daisy or master.

Suggestions on what to use instead or how to debug this?

Thanks!

-- 
John Carter
Phone : (64)(3) 358 6639
Tait Electronics
PO Box 1645 Christchurch
New Zealand

-- 

------------------------------
This email, including any attachments, is only for the intended recipient. 
It is subject to copyright, is confidential and may be the subject of legal 
or other privilege, none of which is waived or lost by reason of this 
transmission.
If you are not an intended recipient, you may not use, disseminate, 
distribute or reproduce such email, any attachments, or any part thereof. 
If you have received a message in error, please notify the sender 
immediately and erase all copies of the message and any attachments.
Unfortunately, we cannot warrant that the email has not been altered or 
corrupted during transmission nor can we guarantee that any email or any 
attachments are free from computer viruses or other conditions which may 
damage or interfere with recipient data, hardware or software. The 
recipient relies upon its own procedures and assumes all risk of use and of 
opening any attachments.
------------------------------

--047d7b41c0cc489f8504fa57e724
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>OpenEmbedded newbie here.<br><br>I&#39;m attempt=
ing to build a headless (no ui) device with sshd, so core-image-lsb-dev see=
m to have more or less what I wanted.<br><br></div>But building results in.=
...<br>

<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb=
(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span style=3D"font-f=
amily:courier new,monospace">bitbake core-image-lsb-dev<br>Loading cache: 1=
00% |######################################################################=
###########################################################################=
###########################| ETA:=C2=A0 00:00:00<br>

Loaded 1219 entries from dependency cache.<br>Parsing recipes: 100% |######=
###########################################################################=
###########################################################################=
##############| Time: 00:00:15<br>

Parsing of 859 .bb files complete (0 cached, 859 parsed). 1218 targets, 38 =
skipped, 0 masked, 0 errors.<br>ERROR: Nothing PROVIDES &#39;core-image-lsb=
-dev&#39;<br>ERROR: core-image-lsb-dev was skipped: missing required distro=
 feature [&#39;pam&#39;] (not in DISTRO_FEATURES)<br>

<br>Summary: There was 1 ERROR message shown, returning a non-zero exit cod=
e.<br></span></blockquote><span style=3D"font-family:courier new,monospace"=
><br></span></div><span style=3D"font-family:courier new,monospace"><span s=
tyle=3D"font-family:arial,helvetica,sans-serif">I get the same problem whet=
her on daisy or master.</span><br>

</span><div><span style=3D"font-family:courier new,monospace"><br></span><d=
iv>Suggestions on what to use instead or how to debug this?<br><br></div><d=
iv>Thanks!<br></div><div><br></div><div><div>-- <br><div dir=3D"ltr">John C=
arter<br>

Phone : (64)(3) 358 6639<br>Tait Electronics=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 <br>PO Box =
1645 Christchurch<br>New Zealand<br><br></div>
</div></div></div></div>

<br>
<hr><font color=3D"#808080">This email, including any attachments, is only
 for the intended recipient. It is subject to copyright, is confidential
 and may be the subject of legal or other privilege, none of which is=20
waived or lost by reason of this transmission.</font><div><font color=3D"#8=
08080">If
 you are not an intended recipient, you may not use, disseminate,=20
distribute or reproduce such email, any attachments, or any part=20
thereof. If you have received a message in error, please notify the=20
sender immediately and erase all copies of the message and any=20
attachments.</font></div><div><font color=3D"#808080">Unfortunately, we=20
cannot warrant that the email has not been altered or corrupted during=20
transmission nor can we guarantee that any email or any attachments are=20
free from computer viruses or other conditions which may damage or=20
interfere with recipient data, hardware or software. The recipient=20
relies upon its own procedures and assumes all risk of use and of=20
opening any attachments.</font></div><div><hr></div>

--047d7b41c0cc489f8504fa57e724--
