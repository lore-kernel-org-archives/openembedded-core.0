Return-Path: <munagala.nareshbabu@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B004271CA2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 16:14:36 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 190so16681681itm.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AH5nXLCzXcVLn8yIkfjOqkynprnZv8jgYYtbXOvefe0=;
	b=pn3d2TmWTqt94NSUIHzAerI+5Igz4kD8tX1SGTm57edP4llnu0LB7b4JAlm1qed98q
	WZe9GhHY4z7ZdTIgeVfsyN+WnwPWxVa+/jbPUpIxLWC51y0yQMbd0hz1IcHShTgc23Ql
	0VXfTEunZCpgvGswBnYwqVUPs6cdETVtjnceeGCp+SftIRJXuQcpL7DKZIWZJ/Hlclls
	6oNbJynkJ9NB8y7AxSNLcDbB0FmVisUCHg/frleJDdXzDJeaM3N3wWsTDU+9GZjztNhG
	ZJySMH+RGtzgaLITbs7j6swlEXnZvO540DKelAzM32v5aRaxe2Kkd1fiL3yBsSsyZmcu
	rh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AH5nXLCzXcVLn8yIkfjOqkynprnZv8jgYYtbXOvefe0=;
	b=coaYIRn4u4ZvF2oR4cfkoBI111PcJT8HJMf0POFvbTJQ+R0OXEyWI+uHQIDDnEsyL6
	/53oAnVeVWrISPyjCpf85VwtRwOvDS7DmnEWNnc21vzya3KN1RYQ8nbODzuAiKVC1O7T
	tEst10fSus29+RQFXgftVj0nAukUeiBSs/MXtuENfbajfeqxbzuO2IWOnFx9rGZXmvMI
	cMgwNpm5XoyKOYrPsdt+PlScerpZYlKTFRhfYL4AylqTtcFXZo/xAoH35XCHs7D8B0NW
	O77ytRaUuQZK87IWb4QMKAIUu6MtmfomJspiJww25+UJg2E2TcOTybV9YnddZhk9F7BZ
	axZw==
X-Gm-Message-State: AFeK/H1M79iRaS5T6MBSdnXb9OHsrFdDIcPWQijbURxvvbmWkBxvt7pAWZdwoF5P+qp9og/TFtoI4Yy6PiKvsg==
X-Received: by 10.107.202.69 with SMTP id a66mr13936641iog.68.1490458477421;
	Sat, 25 Mar 2017 09:14:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.159.212 with HTTP; Sat, 25 Mar 2017 09:14:36 -0700 (PDT)
From: Munagala Naresh <munagala.nareshbabu@gmail.com>
Date: Sat, 25 Mar 2017 21:44:36 +0530
Message-ID: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: CPU profiling at thread level
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
X-List-Received-Date: Sat, 25 Mar 2017 16:14:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c0bad161990bc054b906899

--94eb2c0bad161990bc054b906899
Content-Type: text/plain; charset=UTF-8

Hi Team,

To analyzes the CPU load consumption of a particular process, we need to
find the thread level consumption. Default *top *and *ps *utils are not
supporting all the parameters that are available in Linux/Android.


Could you please suggest some alternatives which works in openembedded
platform?


Appreciate any pointers.

Thanks
Naresh

--94eb2c0bad161990bc054b906899
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"color:rgb(31,73,125)">Hi Team,</s=
pan><br><br><span style=3D"font-size:11pt;font-family:&quot;calibri&quot;,s=
ans-serif;color:rgb(31,73,125)">

</span><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">To analy=
zes the CPU load consumption of a particular process, we need to find the t=
hread level consumption. Default <b>top </b>and <b>ps </b>utils are not sup=
porting all the parameters that are available in Linux/Android. <br></span>=
</p><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><br></span>=
</p>

<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">Could you pleas=
e suggest some
alternatives which works in openembedded platform?</span></p><p class=3D"Ms=
oNormal"><span style=3D"color:rgb(31,73,125)"><br></span></p><p class=3D"Ms=
oNormal"><span style=3D"color:rgb(31,73,125)">Appreciate any pointers. <br>=
</span></p><br></div>Thanks<br></div>Naresh <br><div><div><div class=3D"gma=
il_signature"><div><br><div><br></div></div><div style=3D"padding:0px;margi=
n-left:0px;margin-top:0px;overflow:hidden;color:black;font-size:10px;text-a=
lign:left;line-height:130%"></div><div style=3D"padding:0px;margin-left:0px=
;margin-top:0px;overflow:hidden;color:black;font-size:10px;text-align:left;=
line-height:130%"></div></div>
</div></div></div>

--94eb2c0bad161990bc054b906899--
