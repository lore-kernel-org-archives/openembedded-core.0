Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RJ45l-0001UB-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 16:04:30 +0200
Received: by qyg14 with SMTP id 14so2058505qyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=lxW8R3lXsALkXGFFwb8vWsEvo630VA7+BNKma+TwuLg=;
	b=K61P/c/Npkfmf0bwcz5U+5ihwsOTn0B60Gp7p+YLB1PTgtkP5oIv0GCI8Dercz5TWU
	ISgbP5MWt/3ikC4+3jeaN4rEyZxhZ+S4buPLyGinPWvOBbQu4Z8G+s0VJkNYBB/sUJ9o
	bcCLEXSD4B63tBXb7dQEscQAyWniAy1ntoUgQ=
Received: by 10.229.34.1 with SMTP id j1mr382511qcd.131.1319637510175; Wed, 26
	Oct 2011 06:58:30 -0700 (PDT)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.187.132 with HTTP; Wed, 26 Oct 2011 06:58:10 -0700 (PDT)
In-Reply-To: <CAEsOVNfvkJkLPMCg=x7Yu3JFQSt2GuupkZgXOpj+YhwFZJZryg@mail.gmail.com>
References: <1319505532-23199-2-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNfvkJkLPMCg=x7Yu3JFQSt2GuupkZgXOpj+YhwFZJZryg@mail.gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Wed, 26 Oct 2011 14:58:10 +0100
X-Google-Sender-Auth: KJjICxBBBqsVO6Pj2Pn8k6TxBgA
Message-ID: <CAKZ=5EUxO=fe+6p5qx4n5Y5_r1GQ+mokXOQhnuNgLbpx7Z4Heg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Wed, 26 Oct 2011 14:04:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 2:59 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
> <julian.pidancet@gmail.com> wrote:
>> +do_configure_prepend () {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0export fu_cv_sys_stat_statfs2_bsize=3Dyes
>
> I'm asking out of curiosity.. why don't these go in meta/site/common inst=
ead?

To be honest, I ignored the very existence of this file. Is this
globally applied to all the recipes ? Isn't there a risk of breaking
other packages by doing this ?

--=20
Julian


