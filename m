Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UPcYt-0005NF-I1
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:42:27 +0200
Received: by mail-vc0-f181.google.com with SMTP id ia10so2214070vcb.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=gDntJxTDtjdXoNvCR8ghJFaA3Ldhika+jRjQlZCOUoc=;
	b=wbMXM/dbrW0YnORVeHOSZcQq5Cg28Ss51HyR1knJddit5BM6tWxIA8AoG2ychE+Wqw
	rydszOkRN08Jg8zBD2OZg80YacIsD5olG07YtZLtXjFujz63jt7wbUZFlHuyvDUoA/pD
	9YIoVbhz0gstfGIeDHKrI4MQpHt+hSg6MSMZIbbdRUdi3BZGDHOSbGAX6uzfjDe1SzSD
	dX/5KH6V794vYOurwOjPWyvqzThSJA8L0Fqjl/J70cyQ/MLQla90XMqaSwSItzKh3Wnr
	3+qDbLdo+RQ2lPd+BXvTc5r2ghpCK3+62vTqqOlDLMo5lyBRu6lTrUKcYgpW+LJA7sLF
	XduQ==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr17256165vds.27.1365528306889;
	Tue, 09 Apr 2013 10:25:06 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 9 Apr 2013 10:25:06 -0700 (PDT)
In-Reply-To: <CAJTo0LaQXb_1LU=APaUJbkNnyXSjEsKngj7vB1sBAC538WufQw@mail.gmail.com>
References: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
	<CALbNGRQ0y3+eMKJESmwo0LnwihNZ_H8NViE1BSr+9igjonJ3XQ@mail.gmail.com>
	<CAJTo0LaQXb_1LU=APaUJbkNnyXSjEsKngj7vB1sBAC538WufQw@mail.gmail.com>
Date: Tue, 9 Apr 2013 19:25:06 +0200
Message-ID: <CALbNGRSmV++=N=FO3gSv0ZpxtGuDvv5V-eSVa7ew7yFM2SD9kA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Marco Cavallini <m.cavallini@koansoftware.com>
Subject: Re: [oe][meta-oe][PATCH 1/4] xinput-calibrator: calibrate touch screen with xorg
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
X-List-Received-Date: Tue, 09 Apr 2013 17:42:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2013 at 6:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 April 2013 17:49, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
>> On Tue, Apr 9, 2013 at 4:19 PM, Marco Cavallini <koansoftware@gmail.com>=
 wrote:
>>>  * Taken from oe-classic
>>>  * This patch includes pointercal-xinput
>>
>> 1. Is this a 'core' component?
>> 2. If so: Why not importing from meta-oe there were several
>> enhancements (mainline) meanwhile?
>> 3. I am again(still) working on this ( systemd/udev plug & play ). It
>> would make my life easier if we wait with this migration
>
> Erm, yeah.  I didn't notice this was from oe-classic.  My xterm
> grumble still applies though!
>
Yes I had the same feeling (gtk-UI looks much smarter). I would like
to address these issues but have some questions:

* xterm: for me it was just a useless package in my image. With the
approach I am working on (first shot [1] - but there were some
enhancements since then) I simply removed xterm from RDEPENDS assuming
people who want manual recalibrating (only those need a terminal for
calibration) will take care in their images which terminal to install.
Is that OK - or other suggestions?
* gtk-UI: Upon what would you suggest to make this decision? Distro
feature? If yes: Which entry?

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/0=
43854.html

Andreas


