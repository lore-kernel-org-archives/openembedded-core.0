Return-Path: <public@plane.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Jul 2016 08:28:53 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB3A6E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 08:28:53 +0000 (UTC)
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <public@plane.gmane.org>) id 1bNFIl-00053H-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2016 10:13:51 +0200
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <forlorn18@gmail.com>) id 1bNFIb-0004xh-AS for
	public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org;
	Wed, 13 Jul 2016 10:13:41 +0200
Received: from mail-wm0-f65.google.com ([74.125.82.65])
	by plane.gmane.org with esmtp (Exim 4.69)
	(envelope-from <forlorn18@gmail.com>)
	id 1bNF6u-0007Qm-Fp; Wed, 13 Jul 2016 10:01:36 +0200
Received: by mail-wm0-f65.google.com with SMTP id q128so299861wma.1;
	Wed, 13 Jul 2016 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version; 
	bh=G8dc9jSP6tjlG5420IxeC+qvm/hgSpSftLkh4CVt7XY=;
	b=PNm53sCIswESPuqe/DMrQJJjzDJlXdcoIRvbdl0/Fcrxw3jZ5k9/s446IMqPYKvneu
	fMTsgUhNLvcKtM8w1YreTLKdPsZhKeLJBr0tJLqbd8isXc5SFLCZlJZ9VH9Wv7N07lQl
	OaFKukb/p/PbIF5vfAI1TiBnbie8cg6WLx7RcyExCpnAdtozIHNOD63+gvxp5hAxMgsV
	/9WhvAQCakcFywHCJNjl6DFyqKlIJ5HCiXtWq32YHob2b6S0/jIVgM3/xw+/yK4hM39S
	+AYuFN4CdMdh0izCSOOqaGKDdRq6Nw+3Fqi1SLxfmuFk/PFV2wQA6PAOjrpBd3KxSYHV
	JEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version;
	bh=G8dc9jSP6tjlG5420IxeC+qvm/hgSpSftLkh4CVt7XY=;
	b=S8G9CUQjB+rmj3NRPIRmYKBFcVTzE8MotxaLsq586/NKkSuzFFFCQpXTlxV08MVZah
	PHe8BnpTnxDSkOtoo+mjUx94I2U9FiTqKWjT/UZFGjssblALjqNM0hd+LQ1SJURLB0pe
	Zi/4sCZLzAm0OSNVIi2tduK003gulTmL6e9y0wCp0BWPCZGKNrV8QeyOdBHP+Re814Sm
	LZ2YS6WAayDxizT+dzXJ+otzrMmoBB0NE900YBk5bw+HFAhm6DimbGBV4ZJ5SQQ18Z/1
	aHrGr4uP3FZ0Pk9AE14tVDhgOFwe+TOtXANA8TzLSKX+/tIBp7d4znKtKXJFOIExaoKv
	N0NA==
X-Gm-Message-State: ALyK8tKD87lGhVewhYThA7GMY0ws63UHfDrmJW38jKNf+QnEsdbpcfKsTviwtTKA/IY5bg==
X-Received: by 10.28.157.10 with SMTP id g10mr1187089wme.34.1468396895548;
	Wed, 13 Jul 2016 01:01:35 -0700 (PDT)
Received: from ConcEmb (ger67-1-88-180-180-180.fbx.proxad.net.
	[88.180.180.180]) by smtp.gmail.com with ESMTPSA id
	t71sm27165705wmt.24.2016.07.13.01.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 01:01:35 -0700 (PDT)
Message-ID: <1468396893.6315.6.camel@gmail.com>
From: Francois Muller <forlorn18@gmail.com>
To: public-ed.bartosh-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org, 
	public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org
Date: Wed, 13 Jul 2016 10:01:33 +0200
In-Reply-To: <20160229151106.GA3674@linux.intel.com>
References: <1456420909-9926-1-git-send-email-kergoth@gmail.com>
	<20160229151106.GA3674@linux.intel.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
X-TMDA-Confirmed: Wed, 13 Jul 2016 10:13:41 +0200
Subject: Re: [PATCH] wic: don't throw away our created swap partition
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
X-List-Received-Date: Wed, 13 Jul 2016 08:28:54 -0000
Content-Type: multipart/alternative; boundary="=-OtBJMcsQ3qYkO+GJ9/R/"

--=-OtBJMcsQ3qYkO+GJ9/R/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Ed,
May you also apply this patch to jethro branch please ?
Wks-created images requires also running mkswap on the target but it
shouldn't be necessary.
Best regards,
François
Le lundi 29 février 2016 à 17:11 +0200, Ed Bartosh a écrit :
> Hi Cristopher,
> 
> Thank you for the patch!
> 
> Acked-by: Ed Bartosh 
> org>
> 
> On Thu, Feb 25, 2016 at 10:21:49AM -0700, Christopher Larson wrote:
> > From: Christopher Larson 
> > c.gmane.org>
> > 
> > We were creating the partition, mkswap'ing it, and then not dd'ing
> > it into
> > place in the final image, as source_file wasn't being set for swap
> > partitions.
> > This would result in a swap partition that couldn't be enabled on
> > target until
> > mkswap was run.
> > 
> > Signed-off-by: Christopher Larson 
> > lfA@public.gmane.org>
> > ---
> >  scripts/lib/wic/kickstart/custom_commands/partition.py | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py
> > b/scripts/lib/wic/kickstart/custom_commands/partition.py
> > index eee25a4..a0e74aa 100644
> > --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> > +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> > @@ -173,6 +173,7 @@ class Wic_PartData(FC4_PartData):
> >              if self.fstype and self.fstype == "swap":
> >                  self.prepare_swap_partition(cr_workdir,
> > oe_builddir,
> >                                              native_sysroot)
> > +                self.source_file = "%s/fs.%s" % (cr_workdir,
> > self.fstype)
> >              elif self.fstype:
> >                  rootfs = "%s/fs_%s.%s.%s" % (cr_workdir,
> > self.label,
> >                                               self.lineno,
> > self.fstype)
> > -- 
> > 2.2.1
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@public.gmane.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> --
> Regards,
> Ed

--=-OtBJMcsQ3qYkO+GJ9/R/
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html><head></head><body><div>Hi Ed,</div><div><br></div><div>May you also apply this patch to jethro branch please ?</div><div>Wks-created images requires also running mkswap on the target but it shouldn't be necessary.</div><div><br></div><div>Best regards,</div><div>François</div><div><br></div><div class="-x-evo-paragraph -x-evo-top-signature-spacer"><br></div><div>Le lundi 29 février 2016 à 17:11 +0200, Ed Bartosh a écrit&nbsp;:</div><blockquote type="cite"><pre>Hi Cristopher,

Thank you for the patch!

Acked-by: Ed Bartosh &lt;ed.bartosh-VuQAYsv1563Yd54FQh9/<a href="mailto:CA@public.gmane.org">CA@public.gmane.org</a>&gt;

On Thu, Feb 25, 2016 at 10:21:49AM -0700, Christopher Larson wrote:
<blockquote type="cite">
From: Christopher Larson &lt;<a href="mailto:chris_larson-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org">chris_larson-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org</a>&gt;

We were creating the partition, mkswap'ing it, and then not dd'ing it into
place in the final image, as source_file wasn't being set for swap partitions.
This would result in a swap partition that couldn't be enabled on target until
mkswap was run.

Signed-off-by: Christopher Larson &lt;<a href="mailto:chris_larson-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org">chris_larson-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org</a>&gt;
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index eee25a4..a0e74aa 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -173,6 +173,7 @@ class Wic_PartData(FC4_PartData):
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
+                self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
             elif self.fstype:
                 rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
                                              self.lineno, self.fstype)
-- 
2.2.1

-- 
_______________________________________________
Openembedded-core mailing list
Openembedded-core-ZwoEplunGu3dfDuKDZ/<a href="mailto:zN51Ccm5ICvs9@public.gmane.org">zN51Ccm5ICvs9@public.gmane.org</a>
<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</blockquote>

-- 
--
Regards,
Ed
</pre></blockquote></body></html>

--=-OtBJMcsQ3qYkO+GJ9/R/--
