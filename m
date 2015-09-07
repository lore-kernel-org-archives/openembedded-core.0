Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CDEC675E80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 14:15:19 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZYxCU-0001qZ-RZ; Mon, 07 Sep 2015 16:15:15 +0200
Message-ID: <1441635313.22688.40.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 07 Sep 2015 15:15:13 +0100
In-Reply-To: <CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Mon, 07 Sep 2015 14:15:20 -0000
Content-Type: multipart/alternative; boundary="=-zcY2AOooo87tqIFLA7Xc"

--=-zcY2AOooo87tqIFLA7Xc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-09-07 at 15:08 +0100, Burton, Ross wrote:
> 
> 
> On 7 September 2015 at 03:19, <wenzong.fan@windriver.com> wrote:
> 
>         +  > Note on targets where the @ character is the start of a
>         comment
>         +  > (eg ARM) then another character is used instead. For
>         example the
>         +  > ARM port uses the % character.
>         
> 
> 
> Is the documentation badly written or does this now broke the build on
> x86?

Surely the ARM assembly code would never have worked on x86 anyway.
It's a bit of a mystery how the original code ever worked for anyone on
ARM, given that binutils has behaved this way for nearly 20 years, but
this patch does seem like an improvement.

I agree that the commit message leaves a little bit to be desired
though.

p.


--=-zcY2AOooo87tqIFLA7Xc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.8.5">
</HEAD>
<BODY>
On Mon, 2015-09-07 at 15:08 +0100, Burton, Ross wrote:
<BLOCKQUOTE TYPE=CITE>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    On 7 September 2015 at 03:19, &lt;<A HREF="mailto:wenzong.fan@windriver.com">wenzong.fan@windriver.com</A>&gt; wrote:
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE>
        +&nbsp; &gt; Note on targets where the @ character is the start of a comment<BR>
        +&nbsp; &gt; (eg ARM) then another character is used instead. For example the<BR>
        +&nbsp; &gt; ARM port uses the % character.<BR>
        <BR>
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    Is the documentation badly written or does this now broke the build on x86?
</BLOCKQUOTE>
<BR>
Surely the ARM assembly code would never have worked on x86 anyway.&nbsp; It's a bit of a mystery how the original code ever worked for anyone on ARM, given that binutils has behaved this way for nearly 20 years, but this patch does seem like an improvement.<BR>
<BR>
I agree that the commit message leaves a little bit to be desired though.<BR>
<BR>
p.<BR>
<BR>
</BODY>
</HTML>

--=-zcY2AOooo87tqIFLA7Xc--
