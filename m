Return-Path: <jonathan.rajotte-julien@efficios.com>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 17:43:13 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 49A5D7FC4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id DBDE024A53B;
	Mon, 20 Jan 2020 12:37:30 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fEAteKMVlVTP; Mon, 20 Jan 2020 12:37:30 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 920D324A4C3;
	Mon, 20 Jan 2020 12:37:30 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 920D324A4C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1579541850;
	bh=xYBowjApfYy3WTA4moFuOghR1nIc62AQWL4tH/Z4vVs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=PD99956YB/rdBWyRqAeeaN4IlkdftxBtegWiQvOvfGHIkJQ6ESLJcVR/THe/xvfVY
	qoWeLOLyQ6m32ykhIfYl3v5QLKeQMnuiUH8vviyV6yIrMYv8rXt/jwMO0VA0X3lYHM
	NPkWBFNgoUZOGhIToBlxIBt0sTGRqqLCVPhAjGj0Q4VPD6RI+AkI+3L4pYgDCsWDAE
	inxdi1wIgfICOJrmi3g7pnYr069P4ngFpsnmSa2PonFOSFylQJH6+Jyo8HOqCu1nHn
	qrAjyyRoPqMFK0BzXaPyjJtw7pDeL9d+hVKagqWzovagdcw5EwaV0QRoq4LEKBga3z
	LyL0zVv9lQ7zw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id B4lNawKBCX1T; Mon, 20 Jan 2020 12:37:30 -0500 (EST)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 28AD424A6C6;
	Mon, 20 Jan 2020 12:37:30 -0500 (EST)
Date: Mon, 20 Jan 2020 12:37:22 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200120173722.GA15172@joraj-alpa>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-10-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200120172510.22648-10-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Mon, 20 Jan 2020 17:43:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Could you point me toward reports for the failing tests?

I just want to make sure they are not actual regression.

A yocto specific patch was dropped that allowed ptest to pass when
lttng-ust is not present. This can be a source of problems.
OE commit:015aea5d93614676decd18578a8ae2d68417cfc5

Also some tests required a minimum requirement for /tmp that could lead to
problem for image/test setup with limited memory since AFAIK /tmp size is
derived from the available memory (at least when using qemu test image).

Cheers

On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:
> These tests are producing failures that appear and
> disappear randomly. This requires investigation
> by someone with expertise, so let's disable until then.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 49cb9046c6c..f42e90bd187 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -58,6 +58,7 @@ PTESTS_FAST = "\
>  #    rt-tests-ptest \ # Needs to be checked whether it runs at all
>  #    bash-ptest \ # Test outcomes are non-deterministic by design
>  #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one of the tests
> +#    lttng-tools-ptest \ # Random failures that are difficult to reproduce
>  #"
>  
>  PTESTS_SLOW = "\
> @@ -67,7 +68,6 @@ PTESTS_SLOW = "\
>      glib-2.0-ptest \
>      gstreamer1.0-ptest \
>      libevent-ptest \
> -    lttng-tools-ptest \
>      openssh-ptest \
>      openssl-ptest \
>      perl-ptest \
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

