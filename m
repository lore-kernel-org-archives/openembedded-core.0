Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDzDG-0005iP-4c
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 16:55:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2012 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="223511135"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2012 07:43:04 -0700
Message-ID: <50588878.3060903@linux.intel.com>
Date: Tue, 18 Sep 2012 07:43:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347977074-3803-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347977074-3803-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] hob: Don't set busy cursor on the root window, just our window
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
X-List-Received-Date: Tue, 18 Sep 2012 14:55:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 07:04 AM, Ross Burton wrote:
> [ YOCTO #3127 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   bitbake/lib/bb/ui/crumbs/builder.py |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
bitbake-devel list might be a better place for this.

Sau!

> diff --git a/bitbake/lib/bb/ui/crumbs/builder.py b/bitbake/lib/bb/ui/crumbs/builder.py
> index 6df1ca4..335a5cb 100755
> --- a/bitbake/lib/bb/ui/crumbs/builder.py
> +++ b/bitbake/lib/bb/ui/crumbs/builder.py
> @@ -809,9 +809,9 @@ class Builder(gtk.Window):
>           self.image_details_page.set_sensitive(sensitive)
>
>           if sensitive:
> -            self.get_root_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.LEFT_PTR))
> +            self.window.set_cursor(None)
>           else:
> -            self.get_root_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH))
> +            self.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH))
>           self.sensitive = sensitive
>
>
>


