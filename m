Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPdjt-00031J-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:57:56 +0200
Received: by mail-wg0-f45.google.com with SMTP id x12so7170405wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=1CsB/mVXFWvWK1zK2bOfHoqoQctjKdgt7Y4qYFBHcfE=;
	b=m+G9VtAmMLzv/QyeDqTTVyqbCZVnYO1dNSGkc5WSazizyVnsEdUjplSBwQrcdlRWpK
	hDfVOxEJeUuE06HccIrdsOi92SLRxgxBMAFn2MbWSk6slGNeVhPUK2U8/71FEcKxyU+r
	WXA5j8px+fEyjXvTHehTLcH1nr+TIC5mSeGRoDL1efXll+agDVzBBTsDwYi7IH4Y1flk
	ToQuvIhM32LTPskdmUWbGtX1BX6XpGPYxodOiUSAW8T6zYWjAuWjW+4KRY+2xh1D7X/Q
	JOxhwEqkuMkA0kzhk6YxYBOPF30feIWIUPAdY0HSyBv26O4k5swtV8rWd0r2RBhVPE6j
	k+xg==
MIME-Version: 1.0
X-Received: by 10.194.178.100 with SMTP id cx4mr40761380wjc.47.1365532833037; 
	Tue, 09 Apr 2013 11:40:33 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 11:40:32 -0700 (PDT)
In-Reply-To: <1491180.EIgD7lcAzZ@helios>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
	<CAHUNapQLmeRw2jz=caaGk-db3UkggOLVL_MrGg_VSeJPwnL+DQ@mail.gmail.com>
	<1491180.EIgD7lcAzZ@helios>
Date: Tue, 9 Apr 2013 14:40:32 -0400
Message-ID: <CAHUNapSj6UYDFxZVruTQ3jByxuoV_kHKZY046Cc8CE+Y6jB63Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Minor comment/doc fixes
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
X-List-Received-Date: Tue, 09 Apr 2013 18:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 2:02 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The openembedded-core-contrib and poky-contrib repos are entirely separate.

D'oh!

Retrying:

$ git remote add contrib git://git.openembedded.org/meta-openembedded-contrib

$ git remote -v
contrib git://git.openembedded.org/meta-openembedded-contrib (fetch)
contrib git://git.openembedded.org/meta-openembedded-contrib (push)
origin  git://git.openembedded.org/meta-openembedded (fetch)
origin  git://git.openembedded.org/meta-openembedded (push)

$ git fetch contrib
remote: Counting objects: 1288, done.
remote: Compressing objects: 100% (554/554), done.
remote: Total 903 (delta 491), reused 592 (delta 296)
Receiving objects: 100% (903/903), 155.45 KiB | 55 KiB/s, done.
Resolving deltas: 100% (491/491), completed with 119 local objects.
From git://git.openembedded.org/meta-openembedded-contrib
 * [new branch]      gnutoo/gpsd-3.4 -> contrib/gnutoo/gpsd-3.4
 * [new branch]      gnutoo/gpsd-3.7 -> contrib/gnutoo/gpsd-3.7
 * [new branch]      gnutoo/libsdl -> contrib/gnutoo/libsdl
 * [new branch]      gnutoo/vala-0.16.0 -> contrib/gnutoo/vala-0.16.0
 * [new branch]      hrw/aarch64-support -> contrib/hrw/aarch64-support
 * [new branch]      hrw/world-cleanups -> contrib/hrw/world-cleanups
 * [new branch]      jansa/for-danny -> contrib/jansa/for-danny
 * [new branch]      jansa/for-danny2 -> contrib/jansa/for-danny2
 * [new branch]      jansa/for-danny3 -> contrib/jansa/for-danny3
 * [new branch]      jansa/in-test -> contrib/jansa/in-test
 * [new branch]      jansa/in-test-cbrake -> contrib/jansa/in-test-cbrake
 * [new branch]      jansa/in-test-felipe -> contrib/jansa/in-test-felipe
 * [new branch]      jansa/in-test-hrw -> contrib/jansa/in-test-hrw
 * [new branch]      jansa/in-test-khem -> contrib/jansa/in-test-khem
 * [new branch]      jansa/in-test-koen -> contrib/jansa/in-test-koen
 * [new branch]      jansa/in-test-ross -> contrib/jansa/in-test-ross
 * [new branch]      jansa/test -> contrib/jansa/test
 * [new branch]      jansa/world -> contrib/jansa/world
 * [new branch]      kraj/updates -> contrib/kraj/updates
 * [new branch]      master     -> contrib/master
 * [new branch]      obi/denzil -> contrib/obi/denzil
 * [new branch]      obi/master -> contrib/obi/master
 * [new branch]      paule/ajenti -> contrib/paule/ajenti
 * [new branch]      paule/cleanup6 -> contrib/paule/cleanup6
 * [new branch]      paule/collectd -> contrib/paule/collectd
 * [new branch]      ross/danny -> contrib/ross/danny
 * [new branch]      ross/gtk   -> contrib/ross/gtk
 * [new branch]      ross/master -> contrib/ross/master
 * [new branch]      ross/piglit -> contrib/ross/piglit
 * [new branch]      ross/pinpoint -> contrib/ross/pinpoint
 * [new branch]      ross/xorg  -> contrib/ross/xorg
 * [new branch]      shr        -> contrib/shr
 * [new branch]      trini/misc-v2 -> contrib/trini/misc-v2

I still don't see a paule/layer-tweaks-core :-(


