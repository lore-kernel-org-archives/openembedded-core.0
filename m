Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E83636F157
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 17:49:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2RHnaoW010408; Thu, 27 Mar 2014 17:49:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3Y1O37BXzMQR; Thu, 27 Mar 2014 17:49:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2RHnVc3010389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 27 Mar 2014 17:49:33 GMT
Message-ID: <1395942565.24890.156.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 Mar 2014 17:49:25 +0000
In-Reply-To: <CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>
References: <cover.1395717014.git.liezhi.yang@windriver.com>
	<5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
	<CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Thu, 27 Mar 2014 17:49:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-27 at 10:21 -0700, Chris Larson wrote:
> 
> On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang
> <liezhi.yang@windriver.com> wrote:
>         If we run "bitbake -S base-files" today, and re-run it
>         tomorrow with
>         nothing changed, we would see that the do_install.sigdata
>         changes
>         because of:
>         
>         do_intall -> do_install_basefilesissue -> DISTRO_VERSION ->
>         DATE
>         
>         We had set:
>         IMAGE_NAME[vardepsexclude] += "DATETIME"
>         in meta/conf/bitbake.conf, we can set a similar line in
>         base-files_3.0.14.bb to fix the problem.
>         
>         [YOCTO #6032]
>         
>         Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> Wont't this mean base-files wouldn't be rebuilt when the day changes?
> This seems problematic to me. I think this is a legitimate case for a
> checksum change. If the distro version changes due to the date
> changing, and the base-files includes the distro version in the issue
> file, then we'd *want* base-files to rebuild to ensure the issue file
> is correct, otherwise it'd be inaccurate, no?
> 
I'm torn on this. Package feed creators probably don't want a package
feed where the package changes daily but I can see this from both sides,
I have often wondered why my build was rebuilding base-files...

Cheers,

Richard



