Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3F26F8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:28:32 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so870162eek.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=tjlZijvexKK70r35xMlRvi8nUsX0oMRiCC74Wop2gGY=;
	b=c3qiOxEu5cNNVz3gAHTsII3IisELsrShIgGTngIA90po25hVgP2AaYtuenfkntr0bL
	O0yfqSfdeFzvb9xfNJdHe+RB+zI6aDXCMxEqq5Qra1lJobstmQfaLHceEb5s56n+jgDT
	OkXFBTxL3S4ZLP08kGS5mV5h4BScwp26JCOUqQsPAE3ejWD3k7Js8+XKQrZJy4d1YYis
	CCFOnqBs3sqYUFUCYsU7nPrqpMsFL4viyfNEmOpKYLcuAAIGcSMvTeMgIu7HoZu0SVe0
	PThKLwDAYuT18izg1uprrL7pqb/53jPmC/U6FOHc17XoaRswpUAaKMzkYwxI20D+tX2w
	JQmA==
X-Gm-Message-State: ALoCoQk1dv1053lQHnejQ0bxSW8phwv9Bdr5AKcTksv4jGKvJ1eCiZ1txS+P61H1xn8RUwtOUky1
X-Received: by 10.14.104.135 with SMTP id i7mr43136850eeg.34.1395332912626;
	Thu, 20 Mar 2014 09:28:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a9db:b3da:284e:1ede?
	([2001:610:612:0:a9db:b3da:284e:1ede])
	by mx.google.com with ESMTPSA id p8sm5157935eef.26.2014.03.20.09.28.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Mar 2014 09:28:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
Date: Thu, 20 Mar 2014 17:28:29 +0100
Message-Id: <B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 16:28:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2014, om 14:28 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 20 March 2014 12:44, Laszlo Papp <lpapp@kde.org> wrote:
>> You are free to NACK without an explanation why it is important, but
>> do not expect it to weigh much that way, at least in my eyes, based =
on
>> that you are not even a maintainer as far as I know.
>=20
> One good reason: systemd reads the LSB headers.

As well as other inits that support sysv mode.

regards,

Koen=

