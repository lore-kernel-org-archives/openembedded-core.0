Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA7F731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:19:52 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s68so71155267qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 07:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QZxJwFQ6qxKtfUsvHMWRUJtn9tmbAoIjJraI0Q7yUdk=;
	b=S6k+o/Kz6NqEVDV/llL6dk7LvDMkWBQA26enRqxICc6mt5WWSr4TkINYFv9Ux4RqQA
	uhiz5tM1gZt6DM7RxjwMNMy12xGnNr6OKqmm0uWvtVLeYOHGsL1BGrbvPU0kAu/VlW7f
	T/6vuKHgVbx96FNa6ltmySEE7xCCU3ZGcpnh4Yv67xiy80GTDoZnpjmsxcWQlEdJnsPJ
	MHU/WS/R1qePGKUoyvws7tU6Dej+bpjh9PRnC3Z/IQJrcpgZnceqQrGO09QdfAqk0lM9
	kGpQzITxpSeTE8z+nsGkEBvZZbd2Oi7tKUl8yVttIZeyokPFxTrIaWgGPhXuWtr8xzUv
	yEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QZxJwFQ6qxKtfUsvHMWRUJtn9tmbAoIjJraI0Q7yUdk=;
	b=IFFD+sgpeM7r7snoPW3O8vKTZXZPf4CA0YVsQ4UQ0hOnjvoboc68O6ijl8QDBS9Xtc
	CC2f2qkcYOJ/NZEHcVw4/W6pym+MuyEONjXRBdcynvyTAAesvrCBwhDYfak51y9NR+Gi
	W5XhwM7Z3RPj00aHN1JuuIKg/R5XVlULKSZNXbEgkvyF97KggiXaUkXM2fky6TKTEB1F
	dnK50axt80U8OpjJ+DhClhMMest+oSgoJmiD+QSzWhiNMgFDtbc6C9K00XOJ/p+VaHP6
	DGr4eon9cCxzFrHGLbFGmue3qLA1aVi4Q5JJeufB3Z0lR2ggw3PaMDWzQH7ENf7buURW
	i/nA==
X-Gm-Message-State: AG10YORWYF6uvWm65CwTJBArcu20mRecJecZKMhGnDI/gBpAeCL/2sCVSb5g5w7cC83pdS9FEcLaiJFJ0Jez4A==
X-Received: by 10.55.75.203 with SMTP id y194mr42483356qka.2.1455031193330;
	Tue, 09 Feb 2016 07:19:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 9 Feb 2016 07:19:23 -0800 (PST)
In-Reply-To: <1454926183-22439-7-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-7-git-send-email-maciej.borzecki@open-rnd.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Feb 2016 07:19:23 -0800
Message-ID: <CAMKF1spPPJYxpF4mNpqXT=_aQdCR9meet=NRQqqjDzwGuoFdGg@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH 6/6] systemd: remove unnecessary code
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
X-List-Received-Date: Tue, 09 Feb 2016 15:19:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 2:09 AM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Remove unnecessary chown on journal file.
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  meta/recipes-core/systemd/systemd_228.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
> index 40ed81a37e78c67bae13f7ee7018d85efa2f6b7d..03434ff9d5ff19fe043332b0b53a4fa96ab2b120 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -209,7 +209,7 @@ do_install() {
>                 sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
>         fi
>
> -       chown root:systemd-journal ${D}/${localstatedir}/log/journal
> +        # chown root:systemd-journal ${D}/${localstatedir}/log/journal
>

journald requires these perms on this directory. Can you describe the
issue it fixes ?

>          # Delete journal README, as log can be symlinked inside volatile.
>          rm -f ${D}/${localstatedir}/log/README
> --
> 2.5.0
>

