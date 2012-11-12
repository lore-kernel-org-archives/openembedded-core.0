Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <general@angri.ru>) id 1TXyEy-0001y4-1O
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 18:56:08 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so6502445vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 09:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=ZTgkfyYsgfyNqdx0EmTOZWXKGp/3DcIiskOcdxHtUcU=;
	b=P4XQ21vNznVRlvx8Pd0vDejCPmZHMalMEF3RQ6k4HY6h7ZlpuoBTPeX8F5uFoanDEK
	qLB39pf3Z79SPgAP47IVHIQJD6y3T+qn96+DFzgXhuqGPzSJzrA+mGbO3wt9uFMFR9Ms
	UqJVAblqls173CnZDT7961RWpRNT3f3AVk8Xs239nNR3I2pGGhRqAC+QuQCPtYDELyo1
	p51B1Ovckq3zZTkRe0KkRKLY5rN/W4wmyZJWdio7rqz9RNsqBjtkyivdNRzpPyRo+aXH
	RjPKQWElgpWgSh1mlvupzIdwpM/A+NqiEY0TYn5Q/6Z7zfvV6We5m3amioKJ3ojUO5yG
	Ji7g==
MIME-Version: 1.0
Received: by 10.52.26.81 with SMTP id j17mr23569250vdg.63.1352742134562; Mon,
	12 Nov 2012 09:42:14 -0800 (PST)
Sender: general@angri.ru
Received: by 10.58.102.197 with HTTP; Mon, 12 Nov 2012 09:42:14 -0800 (PST)
Received: by 10.58.102.197 with HTTP; Mon, 12 Nov 2012 09:42:14 -0800 (PST)
In-Reply-To: <CAKmrg8OVpDG58t_jARYGvjBSenbdL7S0C077b7+ivHmpfveeDA@mail.gmail.com>
References: <CAKmrg8OVpDG58t_jARYGvjBSenbdL7S0C077b7+ivHmpfveeDA@mail.gmail.com>
Date: Mon, 12 Nov 2012 20:42:14 +0300
X-Google-Sender-Auth: jrcTJDZ_EH8LrpnppLUt2Wmvaik
Message-ID: <CAKmrg8MS91e7tQK2HWr7SogsNpXhw+oyGS_rbROcQDm+u6aPQQ@mail.gmail.com>
From: anton@angri.ru
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkl0O8sQxjvLVstlUvmvlUV1Pl94eI+RhtT7c5+53eRocgOz2dgDuCqhBmkkDZsXl9QdAwa
Subject: device node creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 17:56:08 -0000
Content-Type: multipart/alternative; boundary=20cf307d0386673f4a04ce4fd236

--20cf307d0386673f4a04ce4fd236
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying to create a device node in the generated rootfs image:
/dev/net/tun. It is required for openvpn to work. Adding it in the living
system is as trivial as "mkdir /dev/net; mknod /dev/net/tun c 10 200", but
I want it to be there with no manual intrusion required.

I tried several ways:

* IMAGE_DEVICE_TABLES
* IMAGE_DEVICE_TABLE
* adding /dev/net/tun file to the package
* adding a node file to the IMAGE_ROOTFS in rootfs postprocess script
* using postinst script that creates the node

None of it worked.

What is the way /dev is populated? Where do all those 256 (why so many
btw?) pty* nodes come from? How do I create the new node?

Thanks!

--
Anton

--20cf307d0386673f4a04ce4fd236
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Hello,</p>
<p>I&#39;m trying to create a device node in the generated rootfs image: /d=
ev/net/tun. It is required for openvpn to work. Adding it in the living sys=
tem is as trivial as &quot;mkdir /dev/net; mknod /dev/net/tun c 10 200&quot=
;, but I want it to be there with no manual intrusion required.</p>

<p>I tried several ways:</p>
<p>* IMAGE_DEVICE_TABLES<br>
* IMAGE_DEVICE_TABLE<br>
* adding /dev/net/tun file to the package<br>
* adding a node file to the IMAGE_ROOTFS in rootfs postprocess script<br>
* using postinst script that creates the node</p>
<p>None of it worked.</p>
<p>What is the way /dev is populated? Where do all those 256 (why so many b=
tw?) pty* nodes come from? How do I create the new node?</p>
<p>Thanks!</p>
<p>--<br>
Anton</p>

--20cf307d0386673f4a04ce4fd236--
