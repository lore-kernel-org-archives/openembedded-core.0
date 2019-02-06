Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 661B96B5C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 08:27:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so6506008wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 00:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=BfCRyJmVQ/0EyMN3OGJrXVwfH+9K3Nt4tcxoQcgbdMU=;
	b=DQpf0REEhlQiVzxVau1c6PxcgOLRegRuP1QiNelQUb9HPT23D3DKz/313Jdx0QWRVJ
	Z8GbUFwrpn8gBkQ/SB396FegzIXOB3Y1bVLpEP0XBUMDviaLbvuD3+np95WTUjjNXF2o
	P6ZQfNRMtLxW/vlfVSsQT6h5rS+ZBz0ZQCyEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BfCRyJmVQ/0EyMN3OGJrXVwfH+9K3Nt4tcxoQcgbdMU=;
	b=hyna0wnIsaVwKOYQmcCCG2jDtdsWuoSp+VG0Cx541Ayj/LqUAkM3dA2ZvGu3InVBri
	Ea5Jb0R3VtyufWrF25vnTzLsoKUtOUc9Ir1ZJfK1ZCrVmv08NFEYPncbe1uPlqMKjfPl
	B/gCk1kT+9LbEU8/gWRoKe14p4MS+aG5J+ksep8ZeLEJ2WE2pGfeEIY3lXDNu1NP42Sp
	vH3z/PZJdvLuBh6tC9fFy9Ir0xaYpeE4zLU86/WwNI/Gj2927RrHe0OR3Mn8GFqBr0nz
	DAyc8NBhjurfeCATKncDOgclq/YJoxfPAEDafe6TOC05edHgDypTXE/IkBe7PCfDGt/z
	RDBg==
X-Gm-Message-State: AHQUAuYqINKlFKoQYHGB8tcK5FBbzUbZ0j8nX8mnZf4gcNvOfzvl1ihr
	JRQDRgGvPXXBUh6VX1832Rua1Q==
X-Google-Smtp-Source: AHgI3IYIvVDAdWLPQM3/nIn/wFxNrOMjrwbMyDYXBbsYKeU8LGZL8By2RVc+aUVtXpLsyZBcTJ055g==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr7160542wrv.138.1549441632001; 
	Wed, 06 Feb 2019 00:27:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a62sm19258017wmf.47.2019.02.06.00.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Feb 2019 00:27:11 -0800 (PST)
Message-ID: <e6be1467690d345114194df39781f34e2837ee6c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 06 Feb 2019 08:27:10 +0000
In-Reply-To: <20190205003627.4454-2-raj.khem@gmail.com>
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<20190205003627.4454-2-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Vlad Zakharov <vzakhar@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Claudiu Zissulescu <claziss@synopsys.com>
Subject: Re: [PATCH 2/2] mpfr: Upgrade to 4.0.2 release
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
X-List-Received-Date: Wed, 06 Feb 2019 08:27:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-04 at 16:36 -0800, Khem Raj wrote:
> --- /dev/null
> +++ b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
> @@ -0,0 +1,94 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool
> upgrade'.
> +# The following is the difference between the old and the new
> license text.
> +# Please update the LICENSE value if needed, and summarize the
> changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- COPYING
> +# +++ COPYING
> +# @@ -1,7 +1,7 @@
> +#                      GNU GENERAL PUBLIC LICENSE
> +#                         Version 3, 29 June 2007
> +#  
> +# - Copyright (C) 2007 Free Software Foundation, Inc. <
> http://fsf.org/>
> +# + Copyright (C) 2007 Free Software Foundation, Inc. <
> https://fsf.org/>
> +#   Everyone is permitted to copy and distribute verbatim copies
> +#   of this license document, but changing it is not allowed.
> +#  
> +# @@ -645,7 +645,7 @@
> +#      GNU General Public License for more details.
> +#  
> +#      You should have received a copy of the GNU General Public
> License
> +# -    along with this program.  If not, see <
> http://www.gnu.org/licenses/>;.
> +# +    along with this program.  If not, see <
> https://www.gnu.org/licenses/>;.
> +#  
> +#  Also add information on how to contact you by electronic and
> paper mail.
> +#  
> +# @@ -664,11 +664,11 @@
> +#    You should also get your employer (if you work as a programmer)
> or school,
> +#  if any, to sign a "copyright disclaimer" for the program, if
> necessary.
> +#  For more information on this, and how to apply and follow the GNU
> GPL, see
> +# -<http://www.gnu.org/licenses/>;.
> +# +<https://www.gnu.org/licenses/>;.
> +#  
> +#    The GNU General Public License does not permit incorporating
> your program
> +#  into proprietary programs.  If your program is a subroutine
> library, you
> +#  may consider it more useful to permit linking proprietary
> applications with
> +#  the library.  If this is what you want to do, use the GNU Lesser
> General
> +#  Public License instead of this License.  But first, please read
> +# -<http://www.gnu.org/philosophy/why-not-lgpl.html>;.
> +# +<https://www.gnu.org/licenses/why-not-lgpl.html>;.
> +# --- COPYING.LESSER
> +# +++ COPYING.LESSER
> +# @@ -1,7 +1,7 @@
> +# -		   GNU LESSER GENERAL PUBLIC LICENSE
> +# +                   GNU LESSER GENERAL PUBLIC LICENSE
> +#                         Version 3, 29 June 2007
> +#  
> +# - Copyright (C) 2007 Free Software Foundation, Inc. <
> http://fsf.org/>
> +# + Copyright (C) 2007 Free Software Foundation, Inc. <
> https://fsf.org/>
> +#   Everyone is permitted to copy and distribute verbatim copies
> +#   of this license document, but changing it is not allowed.
> +#  
> +# @@ -10,7 +10,7 @@
> +#  the terms and conditions of version 3 of the GNU General Public
> +#  License, supplemented by the additional permissions listed below.
> +#  
> +# -  0. Additional Definitions. 
> +# +  0. Additional Definitions.
> +#  
> +#    As used herein, "this License" refers to version 3 of the GNU
> Lesser
> +#  General Public License, and the "GNU GPL" refers to version 3 of
> the GNU
> +# @@ -111,7 +111,7 @@
> +#         a copy of the Library already present on the user's
> computer
> +#         system, and (b) will operate properly with a modified
> version
> +#         of the Library that is interface-compatible with the
> Linked
> +# -       Version. 
> +# +       Version.
> +#  
> +#     e) Provide Installation Information, but only if you would
> otherwise
> +#     be required to provide such information under section 6 of the
> +# 
> +#

Could we fix the FIXME please? :)

Cheers,

Richard



