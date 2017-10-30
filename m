Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 17CC56011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 15:17:00 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id v78so11876836pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=nYp7g/eEfS9sM//gcfRbebRqUSmVVW87CxjKXJNPyis=;
	b=XlMgtsQYsPcw2emnbY3Rl/w8W/rZVdi5QD4g/VT5DNeekfjj595HvTOt9oZaniKg21
	pSOFefhJ2PLvbu+36B4uPyy1LWiTWUPDKD3sZhNNJ+zzWjwfFKcKwQok/gzMRYj6sPcN
	2nrAI/HaXxBp5r/6umoc0bV0HRswrByDdE8jBbKXmbPsm/ftoZC38K+VF2eowa2rDCAw
	srabpn70NDS9CziE81GTUnGbgWIgQhCaj5WDq9uQmFrHrdXu2UVxrG3+4bTsYlzTAHnA
	lWXJ1Y49OTYwzecc9YeR+jLCQpGAY9ePa2n7vCxyRzMcqZ7p+NJJ91S668wKEcw2I+ww
	upIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nYp7g/eEfS9sM//gcfRbebRqUSmVVW87CxjKXJNPyis=;
	b=q0sL3qBy3XQwtXr70LBGNi6hF6HP2m3IOWHr43sRLZFvHTiFcUAmXX4HAtJ2kaDAUZ
	O9jDNrzjf7kkVDQOu2LuvW9ZdshlmDA2JGiTAS7MWRrDKVPvDNgLHODUSvabgmjHAXK1
	NfCX08tKM6v1Hk3GbLBPgwsCFLd/2RbnT5HyzHkp5MDhnNJedQUqNgN+nJCgyb/2JyxE
	kA2wVu2d+Uf5prBA8s6HIeKAYItROmfBLSncGdyJQprcAZUww/u2/2ExA8LinsoZu4ah
	iEFyz2RQaOJM93Qh0wC4sGVXZj+L6ghdNnQfLrlXqmakaFcXhS9mQtDbKx3xS0eHxe5L
	sRcg==
X-Gm-Message-State: AMCzsaUinwpPExROI3gLbab/3Bx5K4rq4yLnaKKGQYcN5TgbTt8s6TiB
	u1JxUwLHuQgEuaP+W5XYBd06RA==
X-Google-Smtp-Source: ABhQp+RXcGTYn/fsqqymlW60+MaTQ1dAiOgy/lqTEG2pdQmC/7zHGGiXNldbbNGeORnoN+a2UE6grA==
X-Received: by 10.84.138.131 with SMTP id 3mr7570520plp.238.1509376621655;
	Mon, 30 Oct 2017 08:17:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:99d3:4afd:3860:fbf5?
	([2601:202:4001:9ea0:99d3:4afd:3860:fbf5])
	by smtp.gmail.com with ESMTPSA id
	i187sm27355219pfc.96.2017.10.30.08.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 08:17:01 -0700 (PDT)
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171030142140.10658-1-joshua.g.lock@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d94c923e-c490-8fd4-3126-5617b84f8174@gmail.com>
Date: Mon, 30 Oct 2017 08:17:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171030142140.10658-1-joshua.g.lock@intel.com>
Subject: Re: [PATCH v2][morty] ruby: fix build of ruby-native with gcc7
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
X-List-Received-Date: Mon, 30 Oct 2017 15:17:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/30/2017 07:21 AM, Joshua Lock wrote:
> Marshalling is broken when ruby-2.2.x is built with gcc7, backport the
> fix in Ruby SVN r57410 to apply to ruby 2.2.5:
>
> https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
>
> Fixes [YOCTO #12271]
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Merged in to stagging.

thanks
- armin
> ---
>
> v2: fixes typo in commit message
>
>  meta/recipes-devtools/ruby/ruby/prevent-gc.patch | 32 ++++++++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_2.2.5.bb         |  2 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/prevent-gc.patch b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
> new file mode 100644
> index 00000000000..729710f2df1
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
> @@ -0,0 +1,32 @@
> +Fix marshalling with gcc7. Based on upstream revision 57410:
> +https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
> +https://github.com/ruby/ruby/commit/7c1b30a602ab109d8d5388d7dfb3c5b180ba24e1
> +https://bugs.ruby-lang.org/issues/13150
> +
> +with the upstream patches intent ported to Ruby 2.2.5
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> +
> +Index: ruby-2.2.5/marshal.c
> +===================================================================
> +--- ruby-2.2.5.orig/marshal.c
> ++++ ruby-2.2.5/marshal.c
> +@@ -17,7 +17,6 @@
> + #include "ruby/io.h"
> + #include "ruby/st.h"
> + #include "ruby/util.h"
> +-
> + #include <math.h>
> + #ifdef HAVE_FLOAT_H
> + #include <float.h>
> +@@ -985,7 +984,7 @@ marshal_dump(int argc, VALUE *argv)
> +     VALUE obj, port, a1, a2;
> +     int limit = -1;
> +     struct dump_arg *arg;
> +-    VALUE wrapper; /* used to avoid memory leak in case of exception */
> ++    volatile VALUE wrapper; /* used to avoid memory leak in case of exception */
> + 
> +     port = Qnil;
> +     rb_scan_args(argc, argv, "12", &obj, &a1, &a2);
> diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> index 5a645821ba0..66ba1d4b844 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> @@ -3,6 +3,8 @@ require ruby.inc
>  SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
>  SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
>  
> +SRC_URI += "file://prevent-gc.patch"
> +
>  # it's unknown to configure script, but then passed to extconf.rb
>  # maybe it's not really needed as we're hardcoding the result with
>  # 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch


