Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USXnP-0006ib-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 21:13:33 +0200
Received: by mail-vb0-f44.google.com with SMTP id e12so1527925vbg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=8pJB6kbrFDQeNxVCbvHfx/jp1BuHNp9FXZnb/qnT8gY=;
	b=MJ6qGXew7EcOoxRGyjpKhbC0cNM8pP3YpZ8KAbaRfGnkOHDhYN7eNZOodxJ+vOLzAq
	w1cbLU6U4qAhdWMWD0Cfej/2LMFKH6semI70D1QhaBRNRjhA3ByCQoASa1p2p93YybFY
	+tPlkNRYtQqW4wJU9rl5j1eL/Q7y4Zg12PosgxktJ6eLVPEiKFf2biM3lm5qKKR9fBPk
	Gt6uYuEH12E8LH09ygosEaJigj1FTFZqycG4+J2tBcb1F/bugIxj7pLZS01hRbvXJYX8
	EY1Yh/6J1RzDdqTLzMxuB2VRgCt/XyQsNv1ZjJ0kSDDJIj9/WMBpfq0rN630AtS+B1sJ
	YBSA==
X-Received: by 10.52.23.115 with SMTP id l19mr5056552vdf.55.1366224958556;
	Wed, 17 Apr 2013 11:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 17 Apr 2013 11:55:37 -0700 (PDT)
In-Reply-To: <B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Apr 2013 19:55:37 +0100
Message-ID: <CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm9/i1alAL0XR08a9TWeHHuyn8FgU+C+5ao5Ab/TTH+B1sXQEVG4z4nZLMtcHxH3JdQLbrq
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 19:13:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 April 2013 19:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I get a similar result here, but I have to rerun all postinsts with gconf=
tool to make the packages actually work. I'll update OE-core tomorrow and t=
ry to get some more debug info. Systemctl says postinsts ran for 3 and a ha=
lf minutes, a big improvement over the 60+ minutes for the same image built=
 against 1.3.

3.5 minutes is still a long time, what packages does it run on the target?

Ross


