Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6356E682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:21:52 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=e130-2.local) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1ajEZc-00014D-O0; Fri, 25 Mar 2016 00:21:53 +0100
Message-ID: <1458861705.2038.43.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 23:21:45 +0000
In-Reply-To: <93EB73B6-E9B5-4DAE-9CCE-3D87FAD794D3@gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
	<1458844322.3476.198.camel@pbcl.net>
	<93EB73B6-E9B5-4DAE-9CCE-3D87FAD794D3@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 23:21:53 -0000
Content-Type: multipart/alternative; boundary="=-5fFbR6hHPALfFqHO+7On"

--=-5fFbR6hHPALfFqHO+7On
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-24 at 15:22 -0700, Khem Raj wrote:

> > On Mar 24, 2016, at 11:32 AM, Phil Blundell <pb@pbcl.net> wrote:
> > 
> > On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
> >> 
> >> Renaming armv8a -> aarch32 is going to affect almost every line in
> >> the patch. We should probably drop the current patch from master-
> >> next.
> > 
> > "AArch32" applies retrospectively to all older versions of the ARM
> > architecture as well,
> 
> not really. Arm refers to aarch32 specifically when we use 32-bit on ARMv8
> so atleast we are speaking same terms.


See the glossary at:

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.aeg0014g/ABCDEFGH.html

AArch32 state
        The ARM 32-bit Execution state that uses 32-bit general purpose
        registers, and a 32-bit program counter (PC), stack pointer
        (SP), and link register (LR). AArch32 Execution state provides a
        choice of two instruction sets, A32 and T32.
        
        In implementations of versions of the ARM architecture before
        ARMv8, and in the ARM R and M architecture profiles, execution
        is always in AArch32 state.
        

p.



--=-5fFbR6hHPALfFqHO+7On
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.8.5">
</HEAD>
<BODY>
On Thu, 2016-03-24 at 15:22 -0700, Khem Raj wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#737373">&gt; On Mar 24, 2016, at 11:32 AM, Phil Blundell &lt;<A HREF="mailto:pb@pbcl.net">pb@pbcl.net</A>&gt; wrote:</FONT>
<FONT COLOR="#737373">&gt; </FONT>
<FONT COLOR="#737373">&gt; On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:</FONT>
<FONT COLOR="#737373">&gt;&gt; </FONT>
<FONT COLOR="#737373">&gt;&gt; Renaming armv8a -&gt; aarch32 is going to affect almost every line in</FONT>
<FONT COLOR="#737373">&gt;&gt; the patch. We should probably drop the current patch from master-</FONT>
<FONT COLOR="#737373">&gt;&gt; next.</FONT>
<FONT COLOR="#737373">&gt; </FONT>
<FONT COLOR="#737373">&gt; &quot;AArch32&quot; applies retrospectively to all older versions of the ARM</FONT>
<FONT COLOR="#737373">&gt; architecture as well,</FONT>

not really. Arm refers to aarch32 specifically when we use 32-bit on ARMv8
so atleast we are speaking same terms.
</PRE>
</BLOCKQUOTE>
<BR>
See the glossary at:<BR>
<BR>
<A HREF="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.aeg0014g/ABCDEFGH.html">http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.aeg0014g/ABCDEFGH.html</A><BR>
<BR>
<I>AArch32 state</I>
<DL>
    The ARM 32-bit Execution state that uses 32-bit general purpose registers, and a 32-bit program counter (PC), stack pointer (SP), and link register (LR). AArch32 Execution state provides a choice of two instruction sets, A32 and T32.<BR>
    <BR>
    In implementations of versions of the ARM architecture before ARMv8, and in the ARM R and M architecture profiles, execution is always in AArch32 state.<BR>
    <BR>
</DL>
p.<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-5fFbR6hHPALfFqHO+7On--
