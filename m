Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RzvTN-0003Sn-Eg
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:34:01 +0100
Received: by obhx4 with SMTP id x4so9387542obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 11:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.193.73 as permitted sender) client-ip=10.182.193.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.193.73 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.193.73])
	by 10.182.193.73 with SMTP id hm9mr7177172obc.29.1329852341779
	(num_hops = 1); Tue, 21 Feb 2012 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hkT/3vxlUnbA/BQy0+HaIhAfD69ZWG84DVZHxVwyBu4=;
	b=pJI5YrchdUM7ELXqLVZ8JSEuts/pD0ZfQu/WraJTcX73dEpjopuKLolvKDSdiF3nHp
	zCjxheRJNGMWBIxV8KCycNA3My39xXx5Hw/3mKSWxe83poS3NCkKHuXAiLs8SzDMLkAM
	0UySJgpEN+bqaJeW1i7eM4c5dfDQL5zmhVeH8=
MIME-Version: 1.0
Received: by 10.182.193.73 with SMTP id hm9mr6158001obc.29.1329852341734; Tue,
	21 Feb 2012 11:25:41 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 21 Feb 2012 11:25:41 -0800 (PST)
In-Reply-To: <4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
Date: Tue, 21 Feb 2012 11:25:41 -0800
Message-ID: <CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 19:34:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 7:40 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
<snip>
> =A0meta/recipes-gnome/gtk+/gtk+_2.24.8.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-

The rebuild of gtk+ triggered by this commit fails on my quad core
build machine:

| configure: error: Package requirements (cairo-xlib >=3D 1.6) were not met=
:
|
| No package 'cairo-xlib' found

I won't have time to look into this until this evening or tomorrow
morning, but will send a patch when I find a fix.

Unless someone beats me to it :-)

Steve


