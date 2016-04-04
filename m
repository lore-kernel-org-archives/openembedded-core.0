Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8DE76710
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 18:54:24 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id p188so157813285lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=mYRhnDr5FhvqB7M+Oq+HVTwkgvNKi6kqaFm2zjsuHp8=;
	b=lhcIxzMjlQwumaHh2waH+doyl8Jya5ytYJLeC34CNBAV+vJO7btRZjsLJ4hJigbD3Q
	Rb1VRbMsET5WLKfgEQkL09gzwmKAkYfSOMlhXT3WYOk9jdfmElJkWapyPDb9/ktNCJF6
	eJp6UgWCGrxtADIJNnFbrAyevB93ZcYT2gnPm3go5caP+Lsk1Y/vW/RYLES3uWsLjHhg
	h7O6kLM946g6FNfJAQ+4vpA/qTlr206v5/GxbGLGxxRxf6D08FZhaixP8sgWNH167B1e
	UIbn8wWyrBfuGkDM/4Hv3bi/08BhMlBqZiWRDWCIJ39XEsx6cV8FJt5lcyRqVXKFFKFb
	UDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=mYRhnDr5FhvqB7M+Oq+HVTwkgvNKi6kqaFm2zjsuHp8=;
	b=QTuTL7l32dBnG+N/U1+HI/K773o4aUfo7EjZvGZtUBo6HQP70HPbb7BAp+QlRqXNv3
	s9duCJ0mOu0j4cswucVfN/bTIYVNUC2u9hWnJMgjNEvGVrGNjiwVz3KCxKJct1+tjMp/
	6EMpEgJj5fK5tVDrIvuPNIbnXoAaG7bO7GL5/20jebJZ5j9gQMZD2P/jkt/4d7SI8jEt
	urGG0w9H8mEK9fDv1+KArQZZ9phxtDJfiN2068wdAs3FqGSrCmqb2DSkhQiOQuT3MRH1
	ijoa9VriUuMh0LCezfG/69Ph/XS+vVCL6SeaMpxWFvMVYko0N8G3FdbPtmz0EOjU4L7i
	bGFA==
X-Gm-Message-State: AD7BkJLcoKj/ByWE/k6HMPNKaMIEUyIQnV+9w+xbH6YKhYkNrnziRo3ENVxttxWnqKta9G4Sy7BBH22s8qwBPg==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr15425690wjc.3.1459796063840; 
	Mon, 04 Apr 2016 11:54:23 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Mon, 4 Apr 2016 11:54:23 -0700 (PDT)
In-Reply-To: <1459760318-3480-1-git-send-email-hainsvdbosch@ziggo.nl>
References: <1459760318-3480-1-git-send-email-hainsvdbosch@ziggo.nl>
Date: Mon, 4 Apr 2016 11:54:23 -0700
Message-ID: <CAJ86T=UQfZNc4AwQtdBNEkRSSyrtVykvmYZ2ZhjXPPD=TP5=qQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Hains van den Bosch <hainsvdbosch@ziggo.nl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad_git: Remove obsolete PACKAGESPLITFUNCS_append = " handle_hls_rename "
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
X-List-Received-Date: Mon, 04 Apr 2016 18:54:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 1:58 AM, Hains van den Bosch
<hainsvdbosch@ziggo.nl> wrote:
> No need for that,now gstreamer_git is 1.7.2

No, this is need BECAUSE gstreamer_git is 1.7.2 (or any version >= 1.7.1).

It gives a smooth upgrade path from gstreamer 1.6.x (which provides
the gstreamer1.0-plugins-bad-fragmented plug-in) to gstreamer >= 1.7.1
(which provides the gstreamer1.0-plugins-bad-hls plug-in).

> Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_git.bb                | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> index ef6581b..cb562ef 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> @@ -51,15 +51,3 @@ do_configure_prepend() {
>         ${S}/autogen.sh --noconfigure
>  }
>
> -# In 1.6.2, the "--enable-hls" configure option generated an installable package
> -# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
> -# has become "gstreamer1.0-plugins-bad-hls". See:
> -# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
> -
> -PACKAGESPLITFUNCS_append = " handle_hls_rename "
> -
> -python handle_hls_rename () {
> -    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
> -    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
> -    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
> -}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

