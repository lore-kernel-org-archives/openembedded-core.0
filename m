Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CD9966FCA6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jun 2014 13:35:26 +0000 (UTC)
Received: from [192.168.178.14] (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 3E96827F40
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jun 2014 15:35:27 +0200 (CEST)
Message-ID: <538B2C1F.9080209@pseudoterminal.org>
Date: Sun, 01 Jun 2014 15:35:27 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1401629621-6635-1-git-send-email-dv@pseudoterminal.org>
In-Reply-To: <1401629621-6635-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [meta-efl][PATCH] e-wm: Add patch to fix crash caused by type error
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
X-List-Received-Date: Sun, 01 Jun 2014 13:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, typo in the git-send-email call. I now re-sent it to the correct 
email address.


> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   .../e17/e-wm/0001-Fix-incorrect-message-type.patch | 28 ++++++++++++++++++++++
>   meta-efl/recipes-efl/e17/e-wm_0.18.7.bb            |  1 +
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
>
> diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch b/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
> new file mode 100644
> index 0000000..e718ef3
> --- /dev/null
> +++ b/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
> @@ -0,0 +1,28 @@
> +From 0aef43c9cd1656413cf2eb3dc7c19b355ee7ed52 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Sun, 1 Jun 2014 14:45:49 +0200
> +Subject: [PATCH] Fix incorrect message type
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + src/bin/e_desk.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/bin/e_desk.c b/src/bin/e_desk.c
> +index b156e19..77d7520 100644
> +--- a/src/bin/e_desk.c
> ++++ b/src/bin/e_desk.c
> +@@ -221,7 +221,7 @@ e_desk_show(E_Desk *desk)
> +    E_Event_Desk_Show *ev;
> +    E_Event_Desk_Before_Show *eev;
> +    E_Event_Desk_After_Show *eeev;
> +-   Edje_Message_Float_Set *msg;
> ++   Edje_Message_Int_Set *msg;
> +    Eina_List *l;
> +    E_Shelf *es;
> +    int was_zone = 0, x, y, dx = 0, dy = 0;
> +--
> +1.8.3.2
> +
> diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
> index 0e39727..929abf6 100644
> --- a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
> +++ b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
> @@ -8,6 +8,7 @@ SRC_URI = "\
>       ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
>       file://enlightenment_start.oe \
>       file://applications.menu \
> +    file://0001-Fix-incorrect-message-type.patch \
>   "
>   
>   SRC_URI[md5sum] = "499b92ef38347881c72729f1e066eb20"


