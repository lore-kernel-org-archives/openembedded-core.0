Return-Path: <net147@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1499471AC2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 10:37:25 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id v127so114553634itd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gnMTgk8NxP05dLgJztuYRcjZV3NMgCKXsR26bGvPkWA=;
	b=Ee8eF6/Pph+wkQxzfx/go5ps6JdQzrd7f/QD3pe8W8GbiWN3Z3SLaqNWanKUjifxB3
	DwT3yvt5SaxWqqFsHlSOYHQRoQcHelW9tloHkX+Zpou3ouPEWlpyN6F2xhhNfAFhGuzp
	RgdVU1b3g7jGukd9VGgFY0V8PC9X6QCxcQh8CxM7v0SwkV73AJlFYo92OQu3PZxPruxd
	6T8n1dgmdVCoTsWNU3m6Sygbl2wrIKB8BdB+nOujgrVAoOIBF1A2pj4CIYZkh3oBe9gY
	SFSRG9gI0xAqwlNTOhW6Al3GSRkB+seVgkC2ZpFPDCUGch6ww2e8hTva9kcOfhqWOoYW
	m3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gnMTgk8NxP05dLgJztuYRcjZV3NMgCKXsR26bGvPkWA=;
	b=cXyKJzqvDq0RohIu6YYnGCzAu8c2BstDgTrCC0pDp77sQT0oubIEGa5xOCAFAwGjGH
	hqbW/9jIRV68FjfszAlmJtY65SUAeTrfJIS0/7C0wKUj93mlGP+4kZ0NDo7igf+sTeCI
	7UQc0OQqx4BF1BZ+1k1EtPxwaz/ZXisnsbK43MjpDQHGHEMIBniriA1+N3WNQF5qTlZR
	FhoO8AVGhY/8sr4otJhYP+vJI/RL3vcSFgVtzftd932kNF/zDQJEvSge5LBC9VRmKP+7
	lbu2TyU+7U+lLxISmJq9uEGY45bNDFBfMKWxowbzQ4JfkN/M5cp3tXntMLTOn8AxfnwY
	q0HA==
X-Gm-Message-State: AIVw113W6d2/qFqkWJKJb46zgzuq7TVqWrhvqdr4fzth3ckOttsyJsGB
	itO20zeGv7/qd0gb87uU2X04oVj7StWe
X-Received: by 10.36.185.14 with SMTP id w14mr15706617ite.76.1501411046869;
	Sun, 30 Jul 2017 03:37:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.198 with HTTP; Sun, 30 Jul 2017 03:37:26 -0700 (PDT)
In-Reply-To: <20170730100236.GA28203@linux.intel.com>
References: <20170728144527.24322-1-net147@gmail.com>
	<20170730100236.GA28203@linux.intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Sun, 30 Jul 2017 20:37:26 +1000
Message-ID: <CANwerB3-Vz2MDKyFTu0kfdA7z2Mgg+y4QtJZ4ZpZZgTABnBCAA@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Sun, 30 Jul 2017 10:37:26 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

On 30 July 2017 at 20:02, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Sat, Jul 29, 2017 at 12:45:27AM +1000, Jonathan Liu wrote:
>> Zero may be interpreted as no MBR signature present and another
>> partitioning program might install a new MBR signature.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
>> index f20d8433f1..fe9b688ab0 100644
>> --- a/scripts/lib/wic/plugins/imager/direct.py
>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>> @@ -297,7 +297,7 @@ class PartitionedImage():
>>                            # all partitions (in bytes)
>>          self.ptable_format = ptable_format  # Partition table format
>>          # Disk system identifier
>> -        self.identifier = int.from_bytes(os.urandom(4), 'little')
>> +        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
>>
>
> Can we generate random identifier by calling os.urandom again if
> self.identifier is zero? Something like this, may be?
>
> while True:
>     self.identifier = int.from_bytes(os.urandom(4), 'little')
>     if self.identifier:
>         break
>
> Assigning constant 0xffffffff can potentially create nonunique identifiers.
>

There is no guarantee that urandom will create unique identifiers.
Infinite loop needs a timeout and error in the case it is unable to
generate a suitable identifier. It is only 0xffffffff if it is 0. That
means 0xffffffff is twice as likely to occur (2 in 4294967296 instead
of 1 in 4294967296) so there is tiny bias. Note that this is how it is
implemented for the DISK_SIGNATURE variable in OE and in GNU Parted as
well.

>>          self.partitions = partitions
>>          self.partimages = []
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> --
> Regards,
> Ed

Regards,
Jonathan

