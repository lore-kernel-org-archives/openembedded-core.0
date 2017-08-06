Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B80B660102
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Aug 2017 14:18:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 123so6368899pga.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Aug 2017 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=zBy15Y+6H/m+hssum9IXmpRhhwUzWUGZP+j0tV3hHzk=;
	b=WCX/W4XoOB3QpcB9XOpZ2faDP7bJlaLi4bJwvPfySHEI5Bt5DB43YoWxeuD7X9nRLz
	qmPHfIwc8Ge1URdgwSzwKC0QNr3+zNGJrIr9j1uSZmnGjjfTurNNDDQwRr1y5U7izD5M
	RL/jIygqbzNC6A2C9CfpuHUUwuBYzx1wcjBQpWEzHvW9c9FFtxSrXXgVMXaPtbNMaTjX
	Bny5ORTbcSD2TC+TxZddWrat84L9SyULe5zv11V4sJw1nL4NUD4iXv8V/GpQ56K+zG3T
	45Zo5R+z1BDu102dteMztmPpSWXvf8HIhxfoK7i9HwZKe3EUiISt+DfG9cvj2WBtzm1Y
	i+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zBy15Y+6H/m+hssum9IXmpRhhwUzWUGZP+j0tV3hHzk=;
	b=PYOEeg2s6oR1RBFN2Kj+/7rDmZg5VoxH6vdbcAiQeBvUHFcxRAwig+xZwGqDUr9KYh
	4KW/Y/RjAPus3uD+ksOXGjMX5O1MGbDEh80Kw3AY7rrcFSLApTwjK9JIQ5uIveUcZmNm
	8Q9fyLmvQ7FztSEwNdE4AM6vgrqbYF1RJpcaJpMwmzhhmP2SlSdyGh4RbNUuNJYd/ujW
	XGp524noDGsAzTl+yrkwVmLqRFLJJoIz/ny0ehsuKfxrFOJNxXDzoOpZKiVp3zq8OHyp
	1kURz2ttQD5Ok1R1KummXo3cMovbUIsaKemwhc2MY7LvFGqivujv+Cdtm90Zy9DPT+UZ
	o8tQ==
X-Gm-Message-State: AHYfb5hIjTx/MGZT+KWFKJ5JXk50HBGy97jJ9815tXUNb2xFosFS6Z7x
	EBi11ChPVd5zAGNR
X-Received: by 10.84.132.111 with SMTP id 102mr3521636ple.154.1502029124662;
	Sun, 06 Aug 2017 07:18:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2c74:fedb:e59f:1991?
	([2601:202:4001:9ea0:2c74:fedb:e59f:1991])
	by smtp.gmail.com with ESMTPSA id
	l132sm11871753pfc.150.2017.08.06.07.18.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Aug 2017 07:18:44 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170804162700.11765-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f77abcad-74b4-677b-cad3-65c03489592a@gmail.com>
Date: Sun, 6 Aug 2017 07:18:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170804162700.11765-1-ross.burton@intel.com>
Subject: Re: [PATCH][morty 1/3] archiver: Escape recipe name in regex
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
X-List-Received-Date: Sun, 06 Aug 2017 14:18:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/04/2017 09:26 AM, Ross Burton wrote:
> From: Joshua Watt <jpewhacker@gmail.com>
>
> The recipe name needs to be escaped when using it in a regular expression so
> that and special characters are treated literally
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
merged into akuster/morty-next.

thanks,
armin
> ---
>   meta/classes/archiver.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 3543ca9c588..188f8c04232 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -349,8 +349,8 @@ python do_ar_recipe () {
>       bbappend_files = d.getVar('BBINCLUDED', True).split()
>       # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
>       # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
> -    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
> -    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
> +    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
> +    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
>       for file in bbappend_files:
>           if bbappend_re.match(file) or bbappend_re1.match(file):
>               shutil.copy(file, outdir)


