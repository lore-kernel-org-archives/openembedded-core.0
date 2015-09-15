Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 05AE876710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:02:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0497C3C88761
Message-ID: <1442332970.3357.38.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:02:50 +0100
In-Reply-To: <1441906252-28516-1-git-send-email-george.mccollister@gmail.com>
References: <1441906252-28516-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Tue, 15 Sep 2015 16:02:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-10 at 12:30 -0500, George McCollister wrote:
> If the path contains 'scripts' more than once the first occurrence
> will be
> incorrectly used. Use rfind instead of find to find the last
> occurrence.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  scripts/lib/wic/plugin.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
> index 41a8017..3acd5b4 100644
> --- a/scripts/lib/wic/plugin.py
> +++ b/scripts/lib/wic/plugin.py
> @@ -42,7 +42,7 @@ class PluginMgr(object):
>  
>      def __init__(self):
>          wic_path = os.path.dirname(__file__)
> -        eos = wic_path.find('scripts') + len('scripts')
> +        eos = wic_path.rfind('scripts') + len('scripts')
>          scripts_path = wic_path[:eos]
>          self.scripts_path = scripts_path
>          self.plugin_dir = scripts_path + PLUGIN_DIR
> -- 
> 2.4.5
> 

