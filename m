Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 136647F28F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:00:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8480CSS006251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 01:00:13 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 4 Sep 2019 01:00:11 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1567417339-325572-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <694a163c-2d9e-d3c2-807a-ef42d7967611@windriver.com>
Date: Wed, 4 Sep 2019 16:00:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567417339-325572-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH V2] man-db: support usrmerge
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
X-List-Received-Date: Wed, 04 Sep 2019 08:00:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping

On 9/2/19 5:42 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-extended/man-db/man-db_2.8.7.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> index bdf340a..083b237 100644
> --- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> @@ -18,7 +18,7 @@ USE_NLS_libc-musl = "no"
>   
>   inherit gettext pkgconfig autotools systemd
>   
> -EXTRA_OECONF = "--with-pager=less"
> +EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
>   EXTRA_AUTORECONF += "-I ${S}/gl/m4"
>   
>   do_install() {

-- 
BRs

Sandy(Li Changqing)


