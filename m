Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id EF01C6AC28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 19:23:34 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so28932781wev.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 11:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=qTlf6gwnJHf9Mb16pzrictY2HU6BLtvfSVzx3zt8f9g=;
	b=cl5JNe3stKJd9PVRkVACgjxs3MCmdVvI3mw2BPASw1XAMolnWuCOYYYOtOLS+k3n1Z
	0dtUTXZmCt2NdaKw3aF3MOCDQH8iMAX5JMtElA/eh4PpN533J0jOZR92Jos5R1ousqQC
	WJOpKkdtj1rIgH9CNLF+tRJd0Qg6582uQ70ttTekaGU3q8ZjmdQI2pvq+P8/DpqR9wOI
	S1ysX2k/7jTGzSAOlMPWLDCoDxjG3UAWCi39O6kEZGqtD9hIdS52d/oDx5B53PhDCOT8
	lmOoWJwzsEd+rbEUSPYqdWUaWjotUhjIKRKvrNAOoZhIGMJyp18bDliHGo0pso7CQThA
	jmuw==
X-Gm-Message-State: ALoCoQmDqfblH/8NXwrfiKnNlPzDxd9V/36aAIV2QZHw4lNlDRq6W+kN985Z6/pNlg5tMplYiysb
X-Received: by 10.181.13.206 with SMTP id fa14mr379109wid.57.1422645814921;
	Fri, 30 Jan 2015 11:23:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.107.132 with HTTP; Fri, 30 Jan 2015 11:23:14 -0800 (PST)
X-Originating-IP: [195.249.186.165]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 30 Jan 2015 21:23:14 +0200
Message-ID: <CAK18fxFLTqDLfWp1rz+56BUY0M05KnQZgMfRO70VTnt+m8Vp0Q@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: libpng 1.6.16 fetch fails
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
X-List-Received-Date: Fri, 30 Jan 2015 19:23:41 -0000
Content-Type: multipart/alternative; boundary=f46d043be046709d93050de38a55

--f46d043be046709d93050de38a55
Content-Type: text/plain; charset=UTF-8

After the latest libpng update, the source link seems broken.

WARNING: Checksum failure encountered with download of
http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.16.tar.xz
- will attempt other sources if available
WARNING: Renaming
/home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz to
/home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz_bad-checksum_b2e23b153fad3034ec48336f81eefd33
ERROR: Fetcher failure for URL: '
http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.16.tar.xz'.
Checksum mismatch!

-- 
*Andrei Gherzan*

--f46d043be046709d93050de38a55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>After the latest libpng update, the source link seems=
 broken.</div><div><br></div><div>WARNING: Checksum failure encountered wit=
h download of <a href=3D"http://downloads.sourceforge.net/project/libpng/li=
bpng16/1.6.16/libpng-1.6.16.tar.xz">http://downloads.sourceforge.net/projec=
t/libpng/libpng16/1.6.16/libpng-1.6.16.tar.xz</a> - will attempt other sour=
ces if available</div><div>WARNING: Renaming /home/agherzan/work/personal/y=
octo/downloads/libpng-1.6.16.tar.xz to /home/agherzan/work/personal/yocto/d=
ownloads/libpng-1.6.16.tar.xz_bad-checksum_b2e23b153fad3034ec48336f81eefd33=
</div><div>ERROR: Fetcher failure for URL: &#39;<a href=3D"http://downloads=
.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.16.tar.xz">http:=
//downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.16.ta=
r.xz</a>&#39;. Checksum mismatch!</div><div><br></div>-- <br><div class=3D"=
gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:center"></div><d=
iv style=3D"text-align:center"><div align=3D"left"><b style=3D"font-family:=
Arial;font-size:small;color:rgb(51,51,51);text-align:center">Andrei Gherzan=
</b><br></div></div></div></div>
</div>

--f46d043be046709d93050de38a55--
