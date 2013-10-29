Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED9AF6D354
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 18:42:00 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id ib11so191914vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2mDm+TnSaWIDfJwGZESI1MXKNgmxoW3nGBixkaFFKCM=;
	b=Wg1b04Oxv5Rp+cghrtzUvCOenyK/isV8FiQJ4tHFhb7UxsTz6vFwD6OYzqEzYYiMzK
	cDj8RXm61nk5fQOijbUa9Ani+4cGx/4/g98yYC+xCa6vrRR8acXY0vBYtAGsgOaOeRC4
	tyq0DYEXXNNn/SWoVEtOGBDSDLF1hxHqmO3jQRTmjUR/JurEc04jD8O1GDitd52ruES/
	9chDQr3PdpbNhyCV2OLe3EgJfFEX30XzQ+hXMsTafsh7SyJiXSVVXpvqWpnPNUtI17uW
	FeUA3XH4sE+Mljnvcb8hgFRyR0cHOCUA6lg33qxWXhVbgXoVtGy/t+vStVWzXykyGHXh
	sU4A==
MIME-Version: 1.0
X-Received: by 10.220.174.200 with SMTP id u8mr450469vcz.6.1383072122330; Tue,
	29 Oct 2013 11:42:02 -0700 (PDT)
Received: by 10.52.66.143 with HTTP; Tue, 29 Oct 2013 11:42:02 -0700 (PDT)
In-Reply-To: <CALbNGRS_SFLVAozE4jJubtmFMVdKkqsMbeWUo0h06i5e6OTpcw@mail.gmail.com>
References: <1381922875-4261-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRS_SFLVAozE4jJubtmFMVdKkqsMbeWUo0h06i5e6OTpcw@mail.gmail.com>
Date: Tue, 29 Oct 2013 19:42:02 +0100
Message-ID: <CALbNGRTjgVqkBk2y53PEqiC_R13Q8TGM9TEhg31ZEZNWUYXxKQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: run-postinsts fix script link
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
X-List-Received-Date: Tue, 29 Oct 2013 18:42:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 9:46 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Oct 16, 2013 at 1:27 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> in
>>
>> commit fe039170236080291c0220476a5809774f82ee5c
>> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> Date:   Wed Oct 2 10:55:32 2013 +0000
>>
>>     systemd-compat-units: Use correct run-postinsts script link
>>
>>     OE-Core commit 75a14923da1ba91eddde47f0907345c19c82d6f0 has moved
>>     run-postinsts script execution from S98 to S99 in rcS.d. run-postins=
ts.service
>>     should check for this script and run it on first boot rather than
>>     S98run-postinsts, which is for opkg/dpkg.
>>
>> the link was corrected but the mentioned commit is not available. Instea=
d of
>> reverting, we use the same variable as opkg for init script ordering and=
 drop
>> a note in case somebody wants to change default.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ping - or am I the only one with nonworking postinst?
>
I'll do that weekly: PING

and to make it clear: commit 75a14923da1ba91eddde47f0907345c19c82d6f0
is a poky commit. So runtime postinst is broken for non-poky-boys.
Thanks for taking care

Andreas

