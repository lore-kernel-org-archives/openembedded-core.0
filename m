Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 174F4782DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jun 2017 07:59:09 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id v7so31798035ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jun 2017 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AB5YaAXRpCehiQ6wUudrro0HDeOU33JC5zsO46GjIcs=;
	b=PeeM6XPPPX3y9zIY0cjKIdW+LfOLBfnE2YfnHrnM0icOOASmTksrCW1U/usnHjk1ws
	Y+QDUv8kQoCz5ZAps/nnPEnQcTllTuHKWuI5VsJzZn3yB5NiyakGtwyEsHY85iCn3OnH
	TaeJdWU7lXKQlQJlKKRdGtyOl+GUKCigYBhYN63KTJjge+m3Se547uWDZ5O1guBq709a
	B09CRIK6mbFJzY+kXis7IUibXl3S/YGmCW6nEkZloIMsnWXMxNYazAM92bg9YEUcBWJg
	rGI//hKi83D+82+NrBFVdaR2SwxR+PeSNYUHF5iO9qWVKChRznNMqq/ZXCqP3lPFjvC5
	6ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AB5YaAXRpCehiQ6wUudrro0HDeOU33JC5zsO46GjIcs=;
	b=NltfBL/iSQAxhE9PRi8e3HTgn/m92K5B/aH3W0CgnNu++mqYHw93Ul1qp+lv2UNU2P
	w+avbVGhK1pYOA3xhMlXFm2ng+zb2778aNWsT+5/wa7x8P4/Cd4Bf+NCtXRXLnZPF/TJ
	mtE7+hX+xFVQv5Ojgmg9oHqrBzh3hHTN7RtwGbE1n5xWNq3RA2i6GT1o3frKw85Tdz54
	Q8r/955SKIqgc39t7S8GIqTjzQqDF6HzPTmHXTMapXcfd+kelDH48w5hakICTNm7q3py
	HBcsuYJxuyS3iFWiXRt6Q8PD/xsVAonP/77wleQS4JZ3wTszZ73qRmBXZbdH1gOOBxvG
	O2tA==
X-Gm-Message-State: AKS2vOzk+pLYl8XpCVeaXDtIBxroO2mZ61Gl0I/Bb3fd/Vtm61d8MwYq
	iXqLdTfmvA1uB/yV9gaQUxfLFOQQjKkD
X-Received: by 10.129.128.132 with SMTP id q126mr7717292ywf.259.1497772750282; 
	Sun, 18 Jun 2017 00:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Sun, 18 Jun 2017 00:59:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Jun 2017 09:59:09 +0200
Message-ID: <CA+chaQebgm-m6rnqtNTqJwnh2AsHVt+2fxhtD53u7hEj-jtvRQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: errors.yoctoproject.org down?
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
X-List-Received-Date: Sun, 18 Jun 2017 07:59:10 -0000
Content-Type: multipart/alternative; boundary="94eb2c034cb2bc28d90552376472"

--94eb2c034cb2bc28d90552376472
Content-Type: text/plain; charset="UTF-8"

bitbake world builds from last night failed to upload the reports with:


NOTE: Uploading the report
/home/jenkins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20170617224113.txt
to errors.yoctoproject.org:80
WARNING: Server connection failed [Errno 104] Connection reset by peer


I can open http://errors.yoctoproject.org/ now, but seems a lot slower
than it used to, so maybe there is still some issue?


Regards,

--94eb2c034cb2bc28d90552376472
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">bitbake world builds from last=
 night failed to upload the reports with:</pre><pre class=3D"gmail-console-=
output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break=
-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">=
<br></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-bo=
x;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x;color:rgb(51,51,51);font-size:14px">NOTE: Uploading the report /home/jenk=
ins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_2017061722411=
3.txt to <a href=3D"http://errors.yoctoproject.org:80">errors.yoctoproject.=
org:80</a>
WARNING: Server connection failed [Errno 104] Connection reset by peer</pre=
><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;white-s=
pace:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:r=
gb(51,51,51);font-size:14px"><br></pre><pre class=3D"gmail-console-output" =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I can op=
en <a href=3D"http://errors.yoctoproject.org/">http://errors.yoctoproject.o=
rg/</a> now, but seems a lot slower than it used to, so maybe there is stil=
l some issue?</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:=
border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-=
bottom:0px;color:rgb(51,51,51);font-size:14px"><br></pre><pre class=3D"gmai=
l-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-=
wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-s=
ize:14px">Regards,</pre></div>

--94eb2c034cb2bc28d90552376472--
