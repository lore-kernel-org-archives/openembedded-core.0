Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1732F609BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 03:00:28 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so8234694pab.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 20:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:subject:date:to;
	bh=JlGgEW20V61hXGApezs6B9MNtQgwDDR3icpEGETbPyY=;
	b=T7uV2eNybozDt87QFQB+hWBdQ75hsiIa7jEppgsr2qAk+6/xh0gkuWkRS9kr8wLlNi
	be1PeM48CDazXgJmwCkYjq/8LOEoEo6tkhp5fGcuEyEp1fz5NFJ6A/TkuN9PduxkFJgJ
	zCt1K6UDNau8hVDwF5c/YTo3CoqFfRqZns1HdquE5qi5Al67YQ7JBOq9NhwV9xmMWNdb
	FYgCsYVVaaq5QSnwB0F90hPi9Fca+GMv0K8/Y87lrQ6esy4UGoe5NBkccpeeA3uLpg7P
	Ko7cyIvD9wftjnHG7zX2Z06OLOAfZr4ZhuMmiSu+f9gI0rTPeTbZY8kvbJawQAdSc9hn
	l3Lg==
X-Received: by 10.67.6.8 with SMTP id cq8mr22938575pad.66.1407553230050;
	Fri, 08 Aug 2014 20:00:30 -0700 (PDT)
Received: from [192.168.1.133] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id z5sm4382934pbt.81.2014.08.08.20.00.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Aug 2014 20:00:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
	<20140806143734.GK14848@jama>
	<2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
Message-Id: <230F811E-E907-4EE1-9C37-817A87E96862@gmail.com>
X-Mailer: iPad Mail (11D257)
Date: Fri, 8 Aug 2014 20:00:30 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Sat, 09 Aug 2014 03:00:37 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Aug 6, 2014, at 7:42 AM, Paul Eggleton <paul.eggleton@linux.intel.com> w=
rote:
>=20
>> On Wednesday 06 August 2014 16:37:34 Martin Jansa wrote:
>>> On Wed, Aug 06, 2014 at 01:41:58PM +0100, Paul Eggleton wrote:
>>>> On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
>>>> * building with libav-9 fails with:
>>>>  | checking for POSTPROC... configure: error: Package requirements
>>>>  | (libpostproc libavcodec libavutil) were not met:
>>>>  |=20
>>>>  | No package 'libpostproc' found
>>>=20
>>> Does gst-ffmpeg actually work with libav > 0.8?
>>=20
>> No, not yet (see world status e-mails), but at least this is step
>> in right direction IMHO and doesn't harm libav-0.8 users.
>=20
> I'm just not sure gst-ffmpeg should be allowed to get past this at all if i=
t's=20
> not currently expected to work. The known working configuration is either=20=

> gst-ffmpeg + libav 0.8.x, or gstreamer1.0-libav + libav > 0.8.x.
>=20
I commented some time ago that 0.8/gst-ffmpeg should just go away... (Along w=
ith X but that's another subject). It just doesn't fit in the trend of multi=
media FOSS anymore... Not that xbmc or vlc are ready for ffmpeg to go away..=
. Sigh. Libpostproc is also an orphan in libav world, no activity since 2012=
. Schisms suck. But we seem to be committed to the libav bus, so keep calm a=
nd ride on.

--Tim=

