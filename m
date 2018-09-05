Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0403A793B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 19:31:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w85JVPGm022772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 5 Sep 2018 20:31:26 +0100
Message-ID: <3cf15f4b0f5f551ff954485158d1c07e19ddb57a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Sep 2018 20:31:25 +0100
In-Reply-To: <f0fcb85e-d3b6-3bd4-8e46-5aa5f03ba5ee@windriver.com>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
	<7eac4cc6501f4799bb542739f6f7e57d@XBOX02.axis.com>
	<f0fcb85e-d3b6-3bd4-8e46-5aa5f03ba5ee@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 19:31:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 16:11 +0800, Robert Yang wrote:
> On 09/05/2018 03:33 PM, Peter Kjellerstedt wrote:
> > > 
> > Put it together with ifelse() and conditional() instead, where it
> > better
> > belongs.
> > 
> > You can also implement it as:
> > 
> > def vartrue(var, iftrue, iffalse, d):
> >      import oe.types
> >      return oe.utils.ifelse(oe.types.boolean(d.getVar(var), iftrue,
> > iffalse):
> 
> Then we need import oe.utils, and I don't think that it's easier to
> read than:
> 
> +
> +def vartrue(var, iftrue, iffalse, d):
> +    import oe.types
> +    if oe.types.boolean(d.getVar(var)):
> +        return iftrue
> +    else:
> +        return iffalse

I think Robert's version is easier to read, the addition of the other
function doesn't really add much. It probably should live alongside the
other varients in the file though.

Cheers,

Richard

