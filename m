Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 057AB72491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 19:55:18 +0000 (UTC)
Received: by qkx62 with SMTP id 62so3762808qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 12:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=FktqHUENdK0GU4ofGedF2vOZCksbVHNCFMJrZnDc5Ic=;
	b=WFjd2eQccksBgSuDKHiVhqiAW2PZk98/TU1N6r9VGwfnee6XuK/1PX+xViJrIFgk70
	vuOROmnhxTb4Y2R7ok77auzRJrf78LnJr/t3L9mg8yVe3giVCx5FOkd13hvqXb4rdUiV
	3mn1B4scNu7xotrf/rcN5DxF7MNHGNu/Ke3l222mEiR9iPqFx+oI7pZbqmG2i4+AzVXt
	rHDC51ArY62uJyf8OOHi6ydGSmc9PfVcgJX6bhaXkv2WNZeMen5vQpY2FeEh7Bldn4+u
	4LFojHlT4W3PUKe3I3FYT8+zbD+kw3hhURMfCANtmuLyq7/T5BjgLRa8QfJikS0DwJ5n
	9aTA==
X-Gm-Message-State: ALoCoQkUfjNrGm0kBSrUTpBW7XwpQroVvXVlZs2gKm1JMB/Vv5FEGNEORsrYV1KywiDnd2CBiWhD
X-Received: by 10.55.23.16 with SMTP id i16mr22534890qkh.14.1430250919459;
	Tue, 28 Apr 2015 12:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 28 Apr 2015 12:54:58 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Apr 2015 20:54:58 +0100
Message-ID: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Moving GStreamer 0.10 to meta-multimedia
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
X-List-Received-Date: Tue, 28 Apr 2015 19:55:19 -0000
Content-Type: multipart/alternative; boundary=001a1146f4bafe93860514ce3d33

--001a1146f4bafe93860514ce3d33
Content-Type: text/plain; charset=UTF-8

Hi all,

This is basically a heads-up that we're working on moving GStreamer 0.10
out of oe-core[1] and into meta-multimedia, where anyone who still needs
0.10 can use and maintain them.

In case anyone out there using GStreamer 0.10 isn't aware, it's been
unmaintained since March 2013[2] and upstream there really mean that:

Last gstreamer commit on 0.10 branch: September 2013
gst-plugins-base: May 2013
gst-plugins-good: August 2013
gst-plugins-bad: August 2013
gst-plugins-ugly: July 2013

If your BSP vendor only ships GStreamer 0.10 plugins now is the time to
harass them about upgrading.

Ross

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294
[2]
http://lists.freedesktop.org/archives/gstreamer-announce/2013-March/000273.html

--001a1146f4bafe93860514ce3d33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>This is basically a heads-up th=
at we&#39;re working on moving GStreamer 0.10 out of oe-core[1] and into me=
ta-multimedia, where anyone who still needs 0.10 can use and maintain them.=
</div><div><br></div><div>In case anyone out there using GStreamer 0.10 isn=
&#39;t aware, it&#39;s been unmaintained since March 2013[2] and upstream t=
here really mean that:</div><div><br></div><div>Last gstreamer commit on 0.=
10 branch: September 2013</div><div>gst-plugins-base: May 2013</div><div>gs=
t-plugins-good: August 2013</div><div>gst-plugins-bad: August 2013</div><di=
v>gst-plugins-ugly: July 2013</div><div><br></div><div>If your BSP vendor o=
nly ships GStreamer 0.10 plugins now is the time to harass them about upgra=
ding.</div><div><br></div><div>Ross</div><div><br></div><div>[1]=C2=A0<a hr=
ef=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6294">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D6294</a></div><div>[2]=C2=A0<a hre=
f=3D"http://lists.freedesktop.org/archives/gstreamer-announce/2013-March/00=
0273.html">http://lists.freedesktop.org/archives/gstreamer-announce/2013-Ma=
rch/000273.html</a></div></div>

--001a1146f4bafe93860514ce3d33--
