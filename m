Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 7C31A75773
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 905BC3C88761
Message-ID: <1442333096.3357.41.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:04:56 +0100
In-Reply-To: <1441886051-18676-2-git-send-email-Martin.Jansa@gmail.com>
References: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
	<1441886051-18676-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH 2/3] rootfs.py: show intercept script output in log.do_rootfs
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
X-List-Received-Date: Tue, 15 Sep 2015 16:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-10 at 13:54 +0200, Martin Jansa wrote:
> * without this the output wasn't shown anywhere even when the bb.warn
>   says:
>   "See log for details!"
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index d2de2c6..15ad642 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -229,7 +229,7 @@ class Rootfs(object):
>              bb.note("> Executing %s intercept ..." % script)
>  
>              try:
> -                subprocess.check_output(script_full)
> +                subprocess.check_call(script_full)
>              except subprocess.CalledProcessError as e:
>                  bb.warn("The postinstall intercept hook '%s' failed
> (exit code: %d)! See log for details!" %
>                          (script, e.returncode))

