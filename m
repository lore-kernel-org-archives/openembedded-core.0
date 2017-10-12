Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDD4470031;
	Thu, 12 Oct 2017 02:15:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m28so4046572pfi.0;
	Wed, 11 Oct 2017 19:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xce35VjhjsJ8vLGp6hqT82VMh+IMQCYCfmEV5C8zkkI=;
	b=mh95QdvcaLaEOje9uwrZrNPw6i8OdN+H8nI61H2QxhspeOcr9+W3+vQWDt8I6RchWq
	gKj0Kcv6rOw9zG0c6s8DCt+S0BzS8JOaCqolxN5cRl8DdZ7kMDYBLSR0g1iX8gBnOUiD
	VXQ5c7nqFv7KSJVrvEd4i99otFSDpWZ2ApZklx+3BAECyGwg6mC0PH6AGeHwmNNQvZqP
	1ezxPunbQmmBLSJVYn0Sic2ALDJKFxJCa2X3Afh7AaZD21a9e3E01rZRonfGDfSUDnYY
	ROdIl4NSNzu4iG95WP1ZSeRQQ/z1vYRNgFaBBQ/CNzHLQRDoomvNp5mE6fLuk8RB/24W
	SHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xce35VjhjsJ8vLGp6hqT82VMh+IMQCYCfmEV5C8zkkI=;
	b=LrZfnIHjrORSYkhIHqhvOsrr6WpeerGfPH3llkBx+5HEaImCAklUjdZMp2EAdQ73p2
	87iYVeDnG+NyT0pRoPhhJJl9mh3JWqnrbaFfRWEcW2QogkOuqzJWP04x10Fb3g2MAR4f
	t9L/aFhcCWa0W8Lp6ov4T60EWOlnKFuvuXigMhalmjGVhNmTuWN8Rw9WOqmj6O1eJL1E
	sAczrYACfwOhN7ihl0cy/vnJ6qzk/2qcT14LTerkKMRWxrLZDivzy/2EXMov3Y7li5HK
	ixvZHal9Uqlwwi+CmlAAI6C/7agoHb7tWOqGSC7xYXiS6gvk4W5afBc9/76ILa/1OunH
	3msA==
X-Gm-Message-State: AMCzsaVFv4jEy1L2ihHB1x+XP1qr5sJcgqasGfAHfsf3cxwPXoLWQ1Sz
	SXBMmgKtxXiluLjsF2ZyBLAzYmfENeo0VPMI4Ys=
X-Google-Smtp-Source: AOwi7QDEpCHkXShaHnMQQEDDcg2MlXA+LZ3ynatFHkjkHaR9lCpJsVr4SPLZgta75S5s31tgsIt1JfLQiSt/LhtwEEI=
X-Received: by 10.84.138.1 with SMTP id 1mr825555plo.404.1507774542873; Wed,
	11 Oct 2017 19:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 11 Oct 2017 19:15:12 -0700 (PDT)
In-Reply-To: <20171012015609.GA3832@jama>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171009090930.73387234938@git.openembedded.org>
	<20171012015609.GA3832@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 19:15:12 -0700
Message-ID: <CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 02:15:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org wrote:
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 8ca61a5464743ff85b6d26886112750d6ddd13e0
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> AuthorDate: Sat Sep 30 16:15:42 2017 +0800
>>
>>     bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
>>
>>     Add tools required by testimage to HOSTTOOLS only when testimage is
>>     inherited. These tools, as described in the comment, are only required
>>     by the testimage task. So this change should not have negtive effect.
>>     This would also solve build error on hosts which miss some tool such as scp.
>>
>>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 6f53b23..0eefb86 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>>  "
>>
>>  # Tools needed to run testimage runtime image testing
>> -HOSTTOOLS += "ip ping ps scp ssh stty"
>> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>
> Shouldn't we include at least ssh by default?

I would say no, since nothing in OE-Core depends on it. more we
abstract from host system better it is.

>
> I have some builds where CONNECTIVITY_CHECK_URIS contains private git repo (to make sure that users
> configured their git + ssh correctly before starting the build) and since this change it fails, because
> of missing ssh:
>
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>
>     Fetcher failure: Fetch command export PATH="...snip.../hosttools"; export HOME="/home/jenkins"; git -c core.fsyncobjectfiles=0 ls-remote ssh://foo.com/bar/repo  failed with exit code 128, output:
> error: cannot run ssh: No such file or directory
> fatal: unable to fork
> .
>     Please ensure your host's network is configured correctly,
>     or set BB_NO_NETWORK = "1" to disable network access if
>     all required sources are on local disk.
>
> I know I can add ssh locally, but do we really need to be so strict
> here? We already include git and git might need ssh.
>
> Regards,
>
>>  # Link to these if present
>>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

