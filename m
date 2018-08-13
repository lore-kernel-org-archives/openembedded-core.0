Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9BD578F5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:03:05 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n21-v6so28882186oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Y5XYzp8pVEz6LNYhFWijAGdvmo5KdXUOg2YmHdJaEqQ=;
	b=XW0ePkCJ5r5swcg38BLIRy66CevpBKC8o3yjqEtQAL6yl3VyQJQtgHcD5FxUFsMXfH
	EjuCqdHFXVKCexkye6T6sVVgiBOxVDT/KpXEfgEFnkirzZ8naDQhbEb5WLUWZo55cVRX
	z7zx3CHmm9yqyxkuRmjeS1Y0FLeHFMP9ii6WjbhEF/tyxj/MBf1Xsk90/4u2pht6xXXG
	8dY0COahET6Ti/sCJdQSzMxsNsU+rf7rrsWRdqsu74AW0QFghd2L30igmTSQQvoUHPcQ
	my3FFXWkIuHO2onQ7pkZXjiRV4gSC52YZd8gviiwdV0hx5ewWkM2wa2tRL14NB2c4gQU
	KWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Y5XYzp8pVEz6LNYhFWijAGdvmo5KdXUOg2YmHdJaEqQ=;
	b=rtbBJFhDGw5ao0N9XNrqOf+BS56EgDW+MbQt6HyqeUrZMWB3VJJXbI/coEMURDVwmC
	WIxflleHe4pIr36uOqiZAnLjDxTYbLSXoZloutWXG0tzkCiFWcc2AfPHLjJ8vhC/S5rJ
	AiBU4L/Lnpn8HATEm8+Mf4AsjzAdZL1S5Dge3HOvWwjDtfe8brVIWpXW69eD9mqQdrif
	3tIph7HrNc07vJ0ImxsYjzb34cS0amu50AX3Hud4oCuw47dwVxzb+vPciy5h2rmJHjvH
	gtLfKg2m8HjEdesE5/4VYNd9S+WD+Cnt6GNyKjEmHVq0qZbPw+osLGa+0MGwRW2kxZ32
	4eyw==
X-Gm-Message-State: AOUpUlHQlyQZ9J8BhEHqm+4pkjFllLIIW9PDw96ZM7i17cyfJdEXcskU
	n9mVaCiveDnvAX+L3LRd150RM9yw
X-Google-Smtp-Source: AA+uWPxkS/LCvtQJAmhrOsmBzBTmp6gv5xTska67R7nq6wI5N8oXt///+wx4StGC3iHJimrXO9CPOw==
X-Received: by 2002:aca:7c5:: with SMTP id
	188-v6mr20164952oih.58.1534183385392; 
	Mon, 13 Aug 2018 11:03:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:64f0:5919:ccc1:f72d?
	([2601:202:4180:c33:64f0:5919:ccc1:f72d])
	by smtp.gmail.com with ESMTPSA id
	1-v6sm9224758oir.19.2018.08.13.11.03.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 11:03:04 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180813172054.17767-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bb9584cf-513d-16de-7b99-b40e5a9b7622@gmail.com>
Date: Mon, 13 Aug 2018 11:03:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813172054.17767-1-ross.burton@intel.com>
Subject: Re: [PATCH 1/3] utils/md5_file: don't iterate line-by-line
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
X-List-Received-Date: Mon, 13 Aug 2018 18:03:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/13/2018 10:20 AM, Ross Burton wrote:
> Opening a file in binary mode and iterating it seems like the simple solution
> but will still break on newlines, which for binary files isn't really useful as
> the size of the chunks could be huge or tiny.
>
> Instead, let's be a bit more clever: we'll be MD5ing lots of files, but we don't
> want to fill up memory: use mmap() to open the file and read the file in 8k
> blocks.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

shouldn't this go to the bitbake mailing list ?
> ---
>  bitbake/lib/bb/utils.py | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index 9903183213b..b20cdabcf01 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -524,12 +524,17 @@ def md5_file(filename):
>      """
>      Return the hex string representation of the MD5 checksum of filename.
>      """
> -    import hashlib
> -    m = hashlib.md5()
> +    import hashlib, mmap
>  
>      with open(filename, "rb") as f:
> -        for line in f:
> -            m.update(line)
> +        m = hashlib.md5()
> +        try:
> +            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mm:
> +                for chunk in iter(lambda: mm.read(8192), b''):
> +                    m.update(chunk)
> +        except ValueError:
> +            # You can't mmap() an empty file so silence this exception
> +            pass
>      return m.hexdigest()
>  
>  def sha256_file(filename):


