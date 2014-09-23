Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id B536A60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:52:55 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x13so1810308qcv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=L8ojX2QVoWFT4yAQD4pMxR7SeJufEWpDvW1U20Nub7o=;
	b=FLU6UZ4n82IxxcfMblJzZ0gkogyfHDdulKO9I1fOZoIOuWMT4uvAxn1TudL9lSVXzr
	FifBfwvnvI7AK5IOLSqfrDGmcdcQ6BEV9p/VjdZLbcGcTSXkds2giSasuEV5ikIZC+g6
	nJgR75sa9y1AYJowKLEUSOGbbl7a8BVmPgpICwJvYDwqau99xQFQ6OnPgcdHKAD8x2Xk
	tJPu6t1Zfk/Y7rTYMlHWzuZgFXni2Ci5fc48E5+eisoNcVbhAadskZsB7opcUMpiGc95
	SP8yCTg5QjY/sGF8dqGd6DuV8aEugIsKOlYPF4Mhmj8BFgCYWZRXvCQL1TbL3GScc8M9
	q9rQ==
X-Gm-Message-State: ALoCoQkT8Rzy4yIU2fhCM+pj21XLNc9PGoMlXWNw9bmiMt20isgFf25RBDnVwx+P6LTXsf7X0oT5
X-Received: by 10.140.94.144 with SMTP id g16mr31990873qge.77.1411483976476;
	Tue, 23 Sep 2014 07:52:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 07:52:36 -0700 (PDT)
In-Reply-To: <e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 15:52:36 +0100
Message-ID: <CAJTo0LZJFpqwAunH5phXyrdJ07y9RwoKqrAAbq6WPi=vVBHrpQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Tue, 23 Sep 2014 14:53:02 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 15:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +pkg_postinst_info () {
> +    for f in `find $D/${infodir} -name "*.info*"`; do
> +        install-info $f $D/${infodir}/dir
> +    done
> +}

For future, this seems like the sort of thing we need a class for.
There is a texinfo.bbclass now...

Ross

