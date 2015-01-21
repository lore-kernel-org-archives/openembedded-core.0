Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id ADD6072C22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 06:02:25 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so13412760pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 22:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UPXJbnTFuF/OJbbWLJ92YS545nNlctPO5CdiuCADQbY=;
	b=J/+fiMVehR2ZbAB94AaWMJvJCSwnq9LBSfs206hNSgj5vD3F8ZAvMkzOx4nBI3N5C+
	QJm/hl5IJ9Y9ifNYAeE8YWP9GbtKOR23T2isXNEz5yv+9vc2Q/HssQS/pJ6cMCFMrbYc
	8fN+c7cYK8TNQbmmRy2RsFkx0LM3ZJj6TFgCPLuakqP4n4fbAtbkMamk+qmmolySUkFG
	MwKLlfl75T0cU4/alvYrWCTKhRK5RRJr9+Z7RWVXLVaf7ZjzeMMBvY7hcLb2qBjmteow
	S6/VLaQ8/XmW2hNJVlCVaeV9HRQxnOQM9QpD880toptaN7dwzNsRXeSGfO7HYYcd0Xzd
	faTg==
X-Received: by 10.66.148.196 with SMTP id tu4mr58632477pab.125.1421820146200; 
	Tue, 20 Jan 2015 22:02:26 -0800 (PST)
Received: from Akusters-laptop-7.local ([2601:c:a700:272f:a566:d45c:b98b:2478])
	by mx.google.com with ESMTPSA id
	nl14sm1736703pdb.81.2015.01.20.22.02.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Jan 2015 22:02:25 -0800 (PST)
Message-ID: <54BF40EF.80900@gmail.com>
Date: Tue, 20 Jan 2015 22:02:23 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Javier Viguera <javier.viguera@digi.com>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
	<54BE21A5.1090705@digi.com>
	<CAJTo0LYH7rThX75FBB+mk=M1BL=Qnnh1Ng4npx4+9AtceVAzGw@mail.gmail.com>
In-Reply-To: <CAJTo0LYH7rThX75FBB+mk=M1BL=Qnnh1Ng4npx4+9AtceVAzGw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Dizzy backport] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Wed, 21 Jan 2015 06:02:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/15, 7:48 AM, Burton, Ross wrote:

will get it. thanks.

Armin
> CC'ing Armin to ensure that he see's this.
>
> Ross
>
> On 20 January 2015 at 09:36, Javier Viguera <javier.viguera@digi.com 
> <mailto:javier.viguera@digi.com>> wrote:
>
>     Hi all,
>
>     Toolchains/SDK generated with Dizzy have the problem this commit
>     fixes.
>
>     So could this be cherry-picked to Dizzy?
>
>     It applies just fine, there is no need to rework it.
>
>     -
>     Regards,
>
>     Javier Viguera
>
>
>     On 01/12/14 17:36, Ross Burton wrote:
>
>         If any part of Python gets installed in a SDK, we need to
>         ensure that all of
>         Python gets installed to avoid replacing python in the
>         environment with a
>         minimal package set.
>
>         Signed-off-by: Ross Burton
>         <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
>         <mailto:ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>>
>         ---
>           meta/recipes-devtools/python/python_2.7.3.bb
>         <http://python_2.7.3.bb> |    1 +
>           1 file changed, 1 insertion(+)
>
>         diff --git a/meta/recipes-devtools/python/python_2.7.3.bb
>         <http://python_2.7.3.bb>
>         b/meta/recipes-devtools/python/python_2.7.3.bb
>         <http://python_2.7.3.bb>
>         index 50c751e..7f13e22 100644
>         --- a/meta/recipes-devtools/python/python_2.7.3.bb
>         <http://python_2.7.3.bb>
>         +++ b/meta/recipes-devtools/python/python_2.7.3.bb
>         <http://python_2.7.3.bb>
>         @@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
>           # manual dependency additions
>           RPROVIDES_${PN}-core = "${PN}"
>           RRECOMMENDS_${PN}-core = "${PN}-readline"
>         +RRECOMMENDS_${PN}-core_append_class-nativesdk = "
>         nativesdk-python-modules"
>           RRECOMMENDS_${PN}-crypt = "openssl"
>           RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
>
>
>     -- 
>     _______________________________________________
>
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


