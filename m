Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 329EB6D476
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:51:15 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu8so359416vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IPtcclLXMuXUArXAhp7AGdpvWjN2FthAt82wmTbRByY=;
	b=CqStHEpqKNYd6rAJinUjhkI9v5MSYK2SMK4cw8nSuvA7yM/3vKQLkela6iHhyO3plX
	S5c45FwKVneHvGlxw9r19TkcAG+jUXGP5MwthYtZ9jQqObcU3BkLhD1hMojamHqM7gSO
	clXuVD0cs/njfHrM2LtMmIFELE49OjvsP6Ak3g13qj/IlpG63/aA/voRQjrb+lhmpcQH
	TraDVdV8Pnbg9miqbGTuyeZTOMu4DV88GmsnRd0xrzDeSoVosStEZebqqxu2yxRwDuuo
	dXH1j4hvzxELvzfbgiLgS+woe2GAVWP+lnQFk8IML2o/B7c7dQAEZqol12LRrjkKQKom
	vjug==
X-Gm-Message-State: ALoCoQlJJXR4M6ua93Ia04rTxVbUO61Q3KZQeByH1dRWXJL+CIvgmI5K1FbQnATB3NpUgtRkVwJ+
X-Received: by 10.52.157.232 with SMTP id wp8mr29682904vdb.4.1384354276270;
	Wed, 13 Nov 2013 06:51:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 13 Nov 2013 06:50:56 -0800 (PST)
In-Reply-To: <52837D78.4030402@balister.org>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
	<1384342720.12863.10.camel@phil-desktop.brightsign>
	<CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
	<52837D78.4030402@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Nov 2013 14:50:56 +0000
Message-ID: <CAJTo0LYaMVrMLSUFEo54ApXGPHsrfMcZbgmzXiYA3K-aqEci7g@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bluez4: Install simple-agent utility for pairing bluetooth devices
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
X-List-Received-Date: Wed, 13 Nov 2013 14:51:16 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2013 13:24, Philip Balister <philip@balister.org> wrote:
> On 11/13/2013 07:34 AM, Burton, Ross wrote:
>> On 13 November 2013 11:38, Phil Blundell <pb@pbcl.net> wrote:
>>> On Wed, 2013-11-13 at 18:08 +0800, Zhong Hongbo wrote:
>>>> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>>>>
>>>> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
>>> [...]
>>>>       install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>>>> +     install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent
>>>
>>> What does simple-agent actually do?  Is it generally enough useful that
>>> it should be installed unconditionally?
>>
>> It's a dumb agent for responding to incoming pairing requests, as it
>> works interactively from a terminal it's purely for testing purposes.
>> I'd prefer to see it (and probably more utilities) installed in
>> bluez4-tests as it's not generally useful.
>
> I think it is also useful for console only devices.

Again, only for interactive use where the user is sitting at a shell
and has started the agent themselves.  You'd never use it in a
production environment.

Ross

