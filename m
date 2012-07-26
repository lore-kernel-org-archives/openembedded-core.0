Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1SuPId-0002Vg-VW
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=3748; q=dns/txt;
	s=iport; t=1343313175; x=1344522775;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to; bh=t/5d7t9TA9Qk36VmPlU4ZiC1VJNit6/OTOM1O3wNbfI=;
	b=JocnRgI7GyeFq9KMgfQqRRFIM2JUB1aUcKUgGtG/1vS8CTrU0bwBoJ2M
	NFCWtnkwaqSYk3Jt9eR7A2jungnsZqzTBzhY5+0j/S/dfXkvnsy0xmrQD
	mTjMufeKHga3kY95fCccjjIMYBI6Nth1mlQAcrw4+l8udN6bXgfE6F4py 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgEFANlTEVCQ/khR/2dsb2JhbABFhXGzSoEHgiABAQEDAQEBAQ8BEEsKBgsLBBQJFgsCAgkDAgECARUBLxMGAgEBHodlBgubWI0ZkyqPJ4IKgRIDkxyCLIEUhEeITIFmgmE
X-IronPort-AV: E=Sophos;i="4.77,659,1336348800"; d="scan'208,217";a="6912404"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 26 Jul 2012 14:32:52 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q6QEWqDQ011246
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:32:52 GMT
Message-ID: <50115514.6070401@cisco.com>
Date: Thu, 26 Jul 2012 16:32:52 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50114E06.2050305@cisco.com> <jurj08$sku$1@dough.gmane.org>
In-Reply-To: <jurj08$sku$1@dough.gmane.org>
Subject: Re: meta-qt5 available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 14:44:24 -0000
Content-Type: multipart/alternative;
	boundary="------------030809040907070801060604"

--------------030809040907070801060604
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, added now.

Hope it will be helpfull. Not sure how much work I will do in that layer
myself. Just updating when I need to I guess. I will however try to add
pull requests from you guys when you give me a patch.

This have only been tested to work on Pandaboard ES, so it's likely it
will break on non-armv7a chips.

- Martin

On 07/26/12 16:08, Koen Kooi wrote:
> Op 26-07-12 16:02, Martin Ertsås schreef:
> > Hi.
>
> > I have just made a new layer, for qt5 recipes. This contains work in
> > progress recipes, but should be working. In the (not so) long run, qt5
> > recipes will hopefully be added to oe-core, but in the meantime
> these are
> > available.
>
> > The recipes are based on the qt4 recipes in oe-core from 4-5 months
> ago,
> > and some of them might be a bit messy. If anyone feels the urge to help
> > out with this layer, and make these recipes as good as humanly
> possible,
> > feel free to do so.
>
> > The project is located at git://github.com/martiert/meta-qt5.git
>
> Don't forget the COPYING.MIT file :)
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--------------030809040907070801060604
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Thanks, added now.<br>
    <br>
    Hope it will be helpfull. Not sure how much work I will do in that
    layer myself. Just updating when I need to I guess. I will however
    try to add pull requests from you guys when you give me a patch.<br>
    <br>
    This have only been tested to work on Pandaboard ES, so it's likely
    it will break on non-armv7a chips.<br>
    <br>
    - Martin<br>
    <br>
    On 07/26/12 16:08, Koen Kooi wrote:<br>
    <blockquote type="cite">Op 26-07-12 16:02, Martin Ertsås schreef:<br>
      &gt; Hi.<br>
      <br>
      &gt; I have just made a new layer, for qt5 recipes. This contains
      work in <br>
      &gt; progress recipes, but should be working. In the (not so) long
      run, qt5 <br>
      &gt; recipes will hopefully be added to oe-core, but in the
      meantime these are<br>
      &gt; available.<br>
      <br>
      &gt; The recipes are based on the qt4 recipes in oe-core from 4-5
      months ago, <br>
      &gt; and some of them might be a bit messy. If anyone feels the
      urge to help <br>
      &gt; out with this layer, and make these recipes as good as
      humanly possible, <br>
      &gt; feel free to do so.<br>
      <br>
      &gt; The project is located at
      git://github.com/martiert/meta-qt5.git<br>
      <br>
      Don't forget the COPYING.MIT file :)<br>
      <br>
    </blockquote>
    <span style="white-space: pre;">&gt;<br>
      &gt;<br>
      &gt; _______________________________________________<br>
      &gt; Openembedded-core mailing list<br>
      &gt; <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
      &gt;
      <a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></span><br>
    <br>
    <br>
  </body>
</html>

--------------030809040907070801060604--
