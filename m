Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TJ3F1-0002wX-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:14:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1085; q=dns/txt; s=iport;
	t=1349186495; x=1350396095;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=QdpZjpMvhtEVVbXy3Lct7WEllXq4RpWJUmOpzMr8kOo=;
	b=kKk6DzTFC0KGjFy+LGXWqAoyVV3za4NKST+OVIXgR1pzRpRcK98KtfLI
	AQMsSqFhh4njhsX68dN3Jp03t57scz6djMai06tRVX/C2l4oNhzFJC7Ob
	dL4qWyLYy8LQOQKfXJ4YVWL61+dbn1PDcJHjac4RCZoaSg6SBIrdN5GXa o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EADTxalCQ/khR/2dsb2JhbABFvlqBCIIgAQEBBBIBHwFFARALGAkWDwkDAgECAUUGDQEFAgEBHodjmSKPVpBoixqGSwOVaYVig1qFBoFpgmk
X-IronPort-AV: E=Sophos;i="4.80,523,1344211200"; d="scan'208";a="77129969"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-2.cisco.com with ESMTP; 02 Oct 2012 14:01:32 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q92E1Wq3026365;
	Tue, 2 Oct 2012 14:01:32 GMT
Message-ID: <506AF2C2.7050703@cisco.com>
Date: Tue, 02 Oct 2012 15:57:22 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
	<1349185900.32611.88.camel@phil-desktop>
	<CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
	<506AF195.9040008@cisco.com>
	<CAP9ODKrUDoCMHf7JX6g8r_PQgQypNTcZ_3T9=+Y=9D5D9_rmWQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrUDoCMHf7JX6g8r_PQgQypNTcZ_3T9=+Y=9D5D9_rmWQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 14:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 10/02/12 15:59, Otavio Salvador wrote:
> On Tue, Oct 2, 2012 at 10:52 AM, Martin Ertsås <mertsas@cisco.com> wrote:
>> On 10/02/12 15:53, Otavio Salvador wrote:
>>> On Tue, Oct 2, 2012 at 10:51 AM, Phil Blundell <philb@gnu.org> wrote:
>>>> On Tue, 2012-10-02 at 10:42 -0300, Otavio Salvador wrote:
>>>>> Or IMAGE_FEATURES += "dbg-img" ;-)
>>>> Where is that implemented?  I couldn't find any obvious reference to
>>>> dbg-img in any classes.
>>> Sorry by cause a missunderstanding ... I was just pointing to a
>>> possible new feature you could add.
>>>
>> that feature is already implemented though, in dbg-pkgs. If you don't
>> mean dbg-img should do something other/more than what dbg-pkgs does?
> To build a separated tar with the symbols, not on the image itself.
>
With only the symbols? Or a separate image with symbols, side by side
with the stripped one? In the later case you could just add a export
IMAGE_BASENAME = "my-dbg-image" in the image recipe. If you mean with
only the symbols I don't think we have any features for that right now.

- Martin


