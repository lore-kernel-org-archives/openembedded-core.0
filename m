Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SEMCi-0006cs-7G
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 16:56:28 +0200
Received: by qcso7 with SMTP id o7so1129808qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2012 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=HqyVPSZJj93QB9IKx9XDObHo59dpvcr6BRutElsDxf0=;
	b=q4dXwYTUojwdpOYnPKCf83CwKjeGp5faka82L8r1QQ7nH5HCxATY8AQjwEQdwtA7f9
	RqUqQuOI2mZVMxhVSyJIUgvpWnOGweSAPA+luSsJhHjYDpF9ukH/VqmcdWDnigozK7Mk
	rCBzapQ0S3+kyICNsnlHkjSrCBj87/4+ZB/vQl2icXAvIP1bcanKwTRhtiL81kE+l4D1
	OpQ1RqwBMBbeiYv/zcc5S9fxtS2CazOJNHCXAsIgxDRCJZYx+IAhYYIHISaIMeBvkVJd
	xlhn1KAu5vConhOe5BNTf83LwSLPcxH3yVP072lrptTvJTv5TZCkEtIy3/keOsGCn6lc
	K9Ag==
Received: by 10.229.111.199 with SMTP id t7mr2030692qcp.84.1333291640766; Sun,
	01 Apr 2012 07:47:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.24.196 with HTTP; Sun, 1 Apr 2012 07:47:00 -0700 (PDT)
In-Reply-To: <CALbNGRT4h0ioq5J0r011Znn3tHaHQLR9WkeaQteTGMsTu_B0NA@mail.gmail.com>
References: <CALbNGRQFQ6=kFVCeVfOgUTPvBVpeSxZZQ2Zak96O5UjjRxxoqQ@mail.gmail.com>
	<CALbNGRT4h0ioq5J0r011Znn3tHaHQLR9WkeaQteTGMsTu_B0NA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 1 Apr 2012 07:47:00 -0700
X-Google-Sender-Auth: lUONSihvA-eMevURSWz7EpPRyxE
Message-ID: <CABcZANn5JURDwa2GkCF-sx9TVh_ciNQX6HTnVOnF04aF0mv9ug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What causes a variable being static/global
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
X-List-Received-Date: Sun, 01 Apr 2012 14:56:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 1, 2012 at 6:10 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Mar 27, 2012 at 5:32 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi,
>>
>> some more stupid questions:
>>
>> What causes a variable being global (accessible by all recipes)?
>> Does the declaration in *.conf lead to global variable?
>> Are there other mechanisms forcing global scope?
>>
>> Thanks in advance
>>
>> Andreas
>
> Maybe my intention was not clear. For a generic run-once
> implementation (see patch for gtk-icon-cache.bbclass [1]) I need
> variables which are shared by all recipes. Each recipe can append data
> so the 'sum' is used at image creation. What steps are necessary
> creating a variable which is existing as one instance for all recipes
> using it?

There are no steps, because there is no support for such a thing.
--=20
Christopher Larson


