Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TJ3AA-0002oe-Lb
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:09:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=581; q=dns/txt; s=iport;
	t=1349186194; x=1350395794;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=BxLn+NMK0yM7OG6e+BhycrB1tEJiBO2kc1pa3cYiyzg=;
	b=P+xOXGD8etKdnv2IAoEBQpqA5W++7Pm314yLyFg5f7xG0TNUJbB7TA30
	D5+/ocWc3gI9VXkdu3uXKojlryV8+ZaZraaSCBhcHVuqwlEydLQdNCKYd
	BfsHCVdqPFG5SnvLAQTNw0HAtqBd44VLUgC76lPuxN+xILVXiQKGzUFGT Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhYFADTxalCQ/khN/2dsb2JhbABFhUS5FoEIgiABAQEEEgFlEQsYCRYPCQMCAQIBRRMGAgEBHodjmSKPVpBoixqDK4MgA5VphWKDWoUGgWmCaQ
X-IronPort-AV: E=Sophos;i="4.80,523,1344211200"; 
   d="scan'208";a="8467814"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-3.cisco.com with ESMTP; 02 Oct 2012 13:56:31 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q92DuVkS000609
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 13:56:31 GMT
Message-ID: <506AF195.9040008@cisco.com>
Date: Tue, 02 Oct 2012 15:52:21 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
	<1349185900.32611.88.camel@phil-desktop>
	<CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 02 Oct 2012 14:09:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/02/12 15:53, Otavio Salvador wrote:
> On Tue, Oct 2, 2012 at 10:51 AM, Phil Blundell <philb@gnu.org> wrote:
>> On Tue, 2012-10-02 at 10:42 -0300, Otavio Salvador wrote:
>>> Or IMAGE_FEATURES += "dbg-img" ;-)
>> Where is that implemented?  I couldn't find any obvious reference to
>> dbg-img in any classes.
> Sorry by cause a missunderstanding ... I was just pointing to a
> possible new feature you could add.
>
that feature is already implemented though, in dbg-pkgs. If you don't
mean dbg-img should do something other/more than what dbg-pkgs does?

- Martin


