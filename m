Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A51BE77616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 16:46:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so12695083pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=s2tCauuHI7UQpYTmDRndv5KSlVtC9H1A5cYcDDB7HYI=;
	b=eYCrobB/Kjf0UKWtZGU0lfj0z8Q0bo5sV4gFImPDUDL9ItcYRstzUwOF9W36i2VhiY
	gguinlPRuzM6usx+lKYPXJ5DAh+UOTS89aMUE54MOlOXjbhVWiuHdFE4cp3jBDbim+Eq
	HQazpvHrzvqfMdXksiW3cUl6iPYpgUPfds2qgOvYS3iBgkiY8dK5ENMxd4hL+vl9Y/Ly
	4erurydaDAvSqlWNjGvcqc0qxTWhqUobseu/Qu/oHzEiRzr9Y72EHYPcGevQ4LPv6H1M
	fKUmLozV8xKf5xGzEFGcVwvYnia2RkO6vg3EMB8k4jxi925BK+ol9y2WZ474x3kSuG63
	xDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=s2tCauuHI7UQpYTmDRndv5KSlVtC9H1A5cYcDDB7HYI=;
	b=q4OHXnStuQPPhNXl8VdMshjtQgcb4PstaianwUUO8ERabuV36qLP48NtLytKe+nVe5
	5bUdSE/IokUMU3Fs8ga1Y2VbrGymHVtlHCs6zRQkbDvzOjfakMa8DJIEcHu9WqmGQvkR
	yzH1hyniITHsxTx+c+tS7gf1dhXTzufEY1C/j2ok+lKxvaVRAg3UnhdQM3Sohju4hOom
	b8eVh8JdCMzHer0HVu3Iv7GSwlzFODufs+WxIPcGjPZMgs96EKl5LBVNwWgvtdhJZQd5
	srkPoxq3jG8hWVZKeT5lUbAS7I0VVplraS7i7zNEfvbaZ6nQq8yicUoNZg7+mkjox3HG
	VuXg==
X-Gm-Message-State: AIkVDXI0cmDG9eR42qZoV81Go15ZTPDys4u6BzNII8rOqQ/he8MzkcTD3CleWRLzIiIwsA==
X-Received: by 10.84.196.164 with SMTP id l33mr21094566pld.150.1482425194772; 
	Thu, 22 Dec 2016 08:46:34 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:dc6c:df58:7743:431c?
	([2601:646:8882:b8c:dc6c:df58:7743:431c])
	by smtp.gmail.com with ESMTPSA id n8sm35203994pgc.0.2016.12.22.08.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 08:46:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71Wjz+80EHxLwtuUAX81ea8OLLDH5qOP_aFZ1S-HHMgYtgMA@mail.gmail.com>
Date: Thu, 22 Dec 2016 08:46:34 -0800
Message-Id: <76D2662B-A921-47C5-802F-01CCDD2DD2A5@gmail.com>
References: <20161222081414.29642-1-raj.khem@gmail.com>
	<CAP71Wjz+80EHxLwtuUAX81ea8OLLDH5qOP_aFZ1S-HHMgYtgMA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.3259)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Backport patches for improving live playback
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
X-List-Received-Date: Thu, 22 Dec 2016 16:46:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 22, 2016, at 2:25 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> On Thu, Dec 22, 2016 at 9:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> ...1-mssdemux-improved-live-playback-support.patch | 929 =
+++++++++++++++++++++
>> ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ++++
>> ...ming-use-the-duration-from-the-list-of-fr.patch |  62 ++
>> .../gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb   |   3 +
>> 4 files changed, 1177 insertions(+)
>> create mode 100644 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-i=
mproved-live-playback-support.patch
>> create mode 100644 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstre=
aming-implement-adaptivedemux-s-get_live_s.patch
>> create mode 100644 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstre=
aming-use-the-duration-from-the-list-of-fr.patch
>>=20
>=20
> Do we really want to do that? Backporting in stable branch looks right
> to me, but backporting to master while we know that we will get gst
> 1.12 on time for the next release anyways, doesn't sound great to me.
> maybe we should get these patches merged in 1.10.x instead of carrying
> them ourselves?

Thats a good idea, if we have 1.12 coming in time for 2.3 release then I =
would not worry about it so much.
however back-porting is certainly a good option but it should be carried =
out independently of OE work.


