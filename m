Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UT7f0-0002iR-V1
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 11:31:18 +0200
Received: by mail-ea0-f170.google.com with SMTP id z7so45627eaf.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 02:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kcvGgwvUZMl7YkPJ2JPrH9sEXVMW/eea1J/++QzVOWg=;
	b=IuwhsZEWMSripDz9gXhK0h7FADjKaotaCVUSDGVyB8uU2FGQyNRs5CXclBUiPUIIMI
	5jnbcTnrc/kNzAQAudPJqfcm2S4OBXKvDMPjiG++LFcgYtuZiTodVI9CuBhE93ZF1vUk
	3fcU9upUXvHY+/ke6VPgyWCseP/4BRNI/eSibke4Qeo4J3bxHP/7pM4kSGqiSYIvYX6r
	RFVgyFpmAiuxdo6rDcLys+hY4YBYQL5p+qaHi6CEW68rRtLezCA5h1g4hWGXSO+qb1Y0
	uPHqSCXKxiWkyhkvWvh49Gjc2CwFsBrl1mcX0GNYl4MIrQ0jpgFjyCQuVWJqMVsGZMf3
	CJ+w==
X-Received: by 10.15.22.76 with SMTP id e52mr40308811eeu.7.1366362820645;
	Fri, 19 Apr 2013 02:13:40 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f9sm6307068eeu.11.2013.04.19.02.13.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:13:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
Date: Fri, 19 Apr 2013 11:13:39 +0200
Message-Id: <623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
	<CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQntEa3c46jjDL5BsSq0TP/CbPXAMbG+jhUCeuQ1tfV5wfjFjg/qF+J4v4tk45H0lNBrYJyo
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
X-List-Received-Date: Fri, 19 Apr 2013 09:31:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 10:52 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 19 April 2013 09:38, Burton, Ross <ross.burton@intel.com> wrote:
>> On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" =
temp/log.do_rootfs
>>> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, =
configuration required on target.
>> ..
>>=20
>> This is "usual" for postinsts that are intercepted and handled in a
>> single go - scroll further down the log and you should see the =
package
>> manager running the intercept scripts (i.e. fontcaches once, =
gconftool
>> once).  I expect you'll see there that the gconftool intercept is
>> breaking for some reason.
>=20
> Actually gconf isn't using triggers but it should happen on the host.
>=20
> I wonder if we're hitting a problem where the postinsts are doing some
> actions on the host and then triggers are "erroring" out and it's all
> falling back to the target.  Can you share the complete rootfs log for
> this gnome image?

Here's the complete log: =
http://dominion.thruhere.net/koen/angstrom/beaglebone/log.do_rootfs

Todays build is still building :(



