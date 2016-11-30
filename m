Return-Path: <Martin.Kepplinger@ginzinger.com>
X-Greylist: delayed 362 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Nov 2016 09:45:56 UTC
Received: from mail.ginzinger.com (mail.ginzinger.com [31.193.165.229])
	by mail.openembedded.org (Postfix) with ESMTP id 74FF471A68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.ginzinger.com (Postfix) with ESMTP id 2AB5C3E9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:39:56 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.10.1 (20141025) (Debian) at ginzinger.com
Received: from mail.ginzinger.com ([127.0.0.1])
	by localhost (mail.ginzinger.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7Rq3HmJX80i
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:39:55 +0100 (CET)
Received: from exc2.buero.ginzinger.com (unknown [10.1.1.201])
	by mail.ginzinger.com (Postfix) with ESMTPS id 12AAA3DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:39:55 +0100 (CET)
Received: from [10.10.1.120] (10.10.1.120) by exc2.buero.ginzinger.com
	(10.1.1.201) with Microsoft SMTP Server (TLS) id 14.3.301.0;
	Wed, 30 Nov 2016 10:39:53 +0100
To: <openembedded-core@lists.openembedded.org>
From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Message-ID: <79e963e5-84c3-808b-754b-ed284775b60c@ginzinger.com>
Date: Wed, 30 Nov 2016 10:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
X-Originating-IP: [10.10.1.120]
Subject: tslib 1.3
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
X-List-Received-Date: Wed, 30 Nov 2016 09:45:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

I found some discussions on tslib in your archives and want to give you
a little update. I'm not even sure core is the correct list for this.

I'm working on tslib for quite some time now. The project page is
https://github.com/kergoth/tslib and has been for quite some time, and
I'm maintaining it there.

With version 1.3 there shouldn't be any need for your environment to be
compatible with tslib's API, as tslib/tools/ts_uinput provides an input
event device to use:

https://github.com/kergoth/tslib#use-tslib-via-a-normal-input-event-device

and you can run it as a daemon (ts_uinput -d).

As of now tslib-1.3-rc1 is out for testing. It adds a new multitouch
API, but ts_uinput should work for single- and multitouch devices and
there shouldn't be a need to wait for Qt or X tslib wrappers to
implement tslib's API or to even have them at all.

The more feedback we get, the earlier we can consider releasing it as
version 1.3.

I hope this is useful,

                           martin

________________________________

Ginzinger electronic systems GmbH
Gewerbegebiet Pirath 16
4952 Weng im Innkreis
www.ginzinger.com

Firmenbuchnummer: FN 364958d
Firmenbuchgericht: Ried im Innkreis
UID-Nr.: ATU66521089


