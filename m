Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UDm1W-0003zA-Ql
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 02:23:07 +0100
Received: by mail-la0-f45.google.com with SMTP id er20so1155980lab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 17:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=UkjBFNyqZteksfHAvyhBXSOg4hjifGrJbDz3AZ47Kvw=;
	b=kFgh4CBR8DLDZsWAWQnPZDBTKwLU7YieOzZj0wc5sGhKjRCbM5w4udMNWkU1IvtI+X
	Lq1JtqQPAzzQgZwzp4nqs3tUSn+p1Eqi2QWEJHBWoQo+Slt9rJ620vTPDlanuYlI/Ead
	vNoky8OYwaT+skRPFHsbxqYBAZJl6NbJH44s2AYSLfIZLncW1iIcYUhxMLYNHlCKi7M4
	ngIQpc2JRuu+zL/RNAml/I20e3HMhDEX3eYPwij3LZAfemeSfwWMHcIAZBWUv+/NQ0Bf
	Gp/Wt4I1eHF99C7QSpmWX4EPCSPq5GAYAvOodgsbNOK1kVPlJHbavnJxgiWJCWXPwari
	K0Bw==
MIME-Version: 1.0
X-Received: by 10.112.8.9 with SMTP id n9mr327105lba.71.1362704789398; Thu, 07
	Mar 2013 17:06:29 -0800 (PST)
Received: by 10.112.61.3 with HTTP; Thu, 7 Mar 2013 17:06:29 -0800 (PST)
In-Reply-To: <cover.1362702690.git.tom.zanussi@linux.intel.com>
References: <cover.1362702690.git.tom.zanussi@linux.intel.com>
Date: Thu, 7 Mar 2013 20:06:29 -0500
Message-ID: <CADkTA4OYYH=2LB1OLT0oJQk-wdTi1H_iWN07hFeR0p+zUpVS-Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tom.zanussi@linux.intel.com
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] perf recipe update
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
X-List-Received-Date: Fri, 08 Mar 2013 01:23:17 -0000
X-List-Received-Date: Fri, 08 Mar 2013 01:23:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 7, 2013 at 7:38 PM,  <tom.zanussi@linux.intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> With the 3.8 kernel update, we need a new perf recipe to match.   Well,
> not really, because there's nothing 3.4-specific about the current one,
> and there's nothing tying it to a specific version of the kernel.
>
> This acknowledges that by getting rid fo the version number.  It also
> adds a minor cleanup to rename the current include file to something
> more appropriate.

Looks good Tom. Thanks for taking care of this.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> The following changes since commit d823759b4594143d522eae0b2a2498436a6dcb1e:
>
>   core-image.bbclass: support read-only rootfs (2013-03-07 11:20:02 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/rename-perf-v0
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rename-perf-v0
>
> Tom Zanussi (2):
>   perf: rename perf.inc to perf-features.inc
>   perf: rename perf_3.4 to perf
>
>  meta/recipes-kernel/perf/{perf.inc => perf-features.inc} | 0
>  meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb}        | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/perf/{perf.inc => perf-features.inc} (100%)
>  rename meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} (99%)
>
> --
> 1.7.11.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


