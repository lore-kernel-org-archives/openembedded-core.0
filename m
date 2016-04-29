Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D44EC60088
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 11:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3TBAr73011627; Fri, 29 Apr 2016 12:10:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jJAtf_WgiQ4u; Fri, 29 Apr 2016 12:10:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3TBAlRA011624
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Apr 2016 12:10:48 +0100
Message-ID: <1461928247.3166.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ian Geiser <geiseri@geekcentral.pub>
Date: Fri, 29 Apr 2016 12:10:47 +0100
In-Reply-To: <15461a3e2b1.db27b2f76194.3175716769885720576@geekcentral.pub>
References: <1461871306-2466-1-git-send-email-geiseri@geekcentral.pub>
	<1461917940.5465.74.camel@linuxfoundation.org>
	<15461a3e2b1.db27b2f76194.3175716769885720576@geekcentral.pub>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Fri, 29 Apr 2016 11:10:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-29 at 06:50 -0400, Ian Geiser wrote:
>  ---- On Fri, 29 Apr 2016 04:19:00 -0400 Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote ---- 
>  > On Thu, 2016-04-28 at 15:21 -0400, Ian Reinhart Geiser wrote: 
>  > > This allows for things like btrfs to be used vs just ext4. 
>  > > The default value of ext4 is kept so there is no functional 
>  > > change unless ROOTFS_TYPE is set in the inherting recipe. 
>  > >  
>  > > Signed-off-by: Ian Reinhart Geiser <geiseri@geekcentral.pub> 
>  > > --- 
>  > >  meta/classes/image-vm.bbclass | 13 +++++++------ 
>  > >  1 file changed, 7 insertions(+), 6 deletions(-) 
>  >  
>  >  
>  > This seems reasonable but could I ask you to use a variable name
> with 
>  > "VM" in the name please? 
>  >  
>  > I appreciate some of the existing ones don't do this but moving
> forward 
>  > we need to try and better namespace some of these class specific 
>  > variables and this seems like a good place to start. 
>  >  
>  > VM_ROOTFS_TYPE would be better for example (or VMIMG_ROOTFS_TYPE).
>  >  
> The other ones have foo_VM in the name.  Would ROOTFS_TYPE_VM be
> acceptable?

I'd really prefer to try and use a prefix since otherwise its harder to
know this is from the VM class rather than the rootfs classes which
already heavily use ROOTFS_*...

Cheers,

Richard

