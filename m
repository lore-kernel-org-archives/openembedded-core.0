Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U8Alo-0004kC-I5
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 15:35:40 +0100
Received: by mail-ie0-f180.google.com with SMTP id bn7so10092583ieb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 06:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=B+tFeOxV1OhvgG6teNSi2C3FAox6sUvEzgSwP3yCTTc=;
	b=E0vefn6xWrC9PBXeYAwVb4gmpzP/e3L6sfqXVy0TofkheZB12TUUTjEyfxoks4gzBV
	zWMtt1DEAL2ZEesBTsREgJSpILskNME/FsQkg0oVvtKPrDSCYOFedwFBQ/rS/SfH63RT
	fCz8oHP4e649ng/LUdJ+CxCkJE3jE0vhFReqHdk42R8Hu4IxBvQhRUEILSfVc+oejhjo
	0rzPMKboVEi79KVpnnUCssywNUuu4s0SHBh+BnFlVfP/r0xi654WsMdGHLUB6KmONm/n
	zy6i9hDZQS1qttKR9WGFSR11z7xS5501knL2TPA9SPkc9fO5QqqhIEXAu0SWruVl/9J/
	k8kw==
MIME-Version: 1.0
X-Received: by 10.50.53.208 with SMTP id d16mr10735137igp.5.1361369969316;
	Wed, 20 Feb 2013 06:19:29 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Wed, 20 Feb 2013 06:19:29 -0800 (PST)
In-Reply-To: <fc06c499d04a1cf82c2d426c17cd2331a6bf718d.1361338900.git.Qi.Chen@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<fc06c499d04a1cf82c2d426c17cd2331a6bf718d.1361338900.git.Qi.Chen@windriver.com>
Date: Wed, 20 Feb 2013 15:19:29 +0100
Message-ID: <CAC1BbcTWjtDiLeDa3970HAL5Za+9iA7sqfs6XsDqahEC4A49gg@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Qi.Chen@windriver.com
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 5/5] populate-volatile.sh: remove trailing whitespaces
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
X-List-Received-Date: Wed, 20 Feb 2013 14:35:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 February 2013 06:55,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Remove trailing whitespaces.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../initscripts-1.0/populate-volatile.sh           |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 24daeb4..d7937b4 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -48,9 +48,9 @@ create_file() {
>  }
>
>  mk_dir() {
> -       EXEC="
> -       mkdir -p \"$1\";
> -       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
> +       EXEC="
> +       mkdir -p \"$1\";
> +       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
>         chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
>
>         test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build

Don't you need ${ROOT_DIR}/etc/volatile.cache.build here (and
everywhere else if there are other cases), too?


