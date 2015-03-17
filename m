Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id B78B76013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:52:04 +0000 (UTC)
Received: by qgf3 with SMTP id 3so8199037qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xzS339yvFm5fiQax4hIN2RJmZA8vxdo1Y3hx7w4O+Qo=;
	b=dlJWBThUDBN2iBwuf2Ut9Lc5VIPuNNMEYV+LkaVwvfGW9f0/gDOcmM894bOwDiaYkm
	l5Kok6IVTiIemV0cb+OOotoSpqODMFus64VejlyvW7i1BVggZfpDbv4lKOvz+ROjflZg
	FhGfi1hx8qRZiyNRJh1WJ6MAPYTy7Reh95g8r7kJn9u1wnFBUAGhElFTzTXMvhMf4DRq
	QGYEBln6I7WGa40dR4itUQJ9Zbk1aHucVX8XQZG578LRFbj5po9T61cXfPZiZKvVGWtO
	2JRZnxXLu01UFYB0c5gRftLKbZuxOIRX0ifi/Jmlx2N4X7+BUslaPoALOBcOnmXmNb0z
	wUqQ==
X-Gm-Message-State: ALoCoQl6OTsdPv4FPNkzY7hXMgHrkuXWu8OGLfvb0qhUUKfueo8PBdFIn4Dht026b9R9+OhGs5+h
X-Received: by 10.229.201.1 with SMTP id ey1mr81897195qcb.10.1426600325755;
	Tue, 17 Mar 2015 06:52:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 06:51:45 -0700 (PDT)
In-Reply-To: <55083111.9090301@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LbvjhZ8nUzua80y+K23n7CS+sY7QcDYg3PqjJWLe+_fwQ@mail.gmail.com>
	<55081C38.9080901@windriver.com>
	<CAJTo0LbffFs6r_GkzF7CTUP+1yxrUydwq6RxRZTgJhbZbhiYSA@mail.gmail.com>
	<55083111.9090301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 15:51:45 +0200
Message-ID: <CAJTo0LZ-eiXWsQ-EJJ7EtnZemiT91PLAuFxwOxcPJTFiuVvLgg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel-yocto: split meta data generation from patching phase
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
X-List-Received-Date: Tue, 17 Mar 2015 13:52:04 -0000
Content-Type: multipart/alternative; boundary=001a11c2e84aa750d205117c457c

--001a11c2e84aa750d205117c457c
Content-Type: text/plain; charset=UTF-8

On 17 March 2015 at 15:50, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Always better to be safe. It's not like we all haven't left those
> in before :)
>

I'm still trying to repend for not noticing that Randy's patch called a
test suite "test_foo". :)

Ross

--001a11c2e84aa750d205117c457c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2015 at 15:50, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1tn" class=3D"a3s" style=3D"overflow:hidden">Always better to be safe.=
 It&#39;s not like we all haven&#39;t left those<br>
in before :)<br></div></blockquote></div><br>I&#39;m still trying to repend=
 for not noticing that Randy&#39;s patch called a test suite &quot;test_foo=
&quot;. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11c2e84aa750d205117c457c--
