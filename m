Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD2160125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:59:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 08:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; 
	d="scan'208,217";a="738904338"
Received: from unknown (HELO besquive-mobl2.amr.corp.intel.com) ([10.219.17.4])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2015 08:59:20 -0700
Message-ID: <1438271967.9280.22.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, humberto.ibarra.lopez@intel.com
In-Reply-To: <CAJTo0LYX2-=PqSBHcj0OTL+TpPa_Es56ZhDeeN8n=z+8VJdw-w@mail.gmail.com>
References: <1438199407-19848-1-git-send-email-humberto.ibarra.lopez@intel.com>
	<CAJTo0LYX2-=PqSBHcj0OTL+TpPa_Es56ZhDeeN8n=z+8VJdw-w@mail.gmail.com>
Organization: Intel Corporation
Date: Thu, 30 Jul 2015 10:59:27 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [scripts][PATCH] yocto-layer: Stops duplication of "meta-" prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 15:59:23 -0000
Content-Type: multipart/alternative; boundary="=-LQiWWFk+IxpeMuBiXxoX"

--=-LQiWWFk+IxpeMuBiXxoX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-30 at 14:28 +0100, Burton, Ross wrote:
> 
> On 29 July 2015 at 20:50, <humberto.ibarra.lopez@intel.com> wrote:
> > The yocto-layer script puts an extra "meta-" prefix to the given
> > layer
> > name even when the prefix is already there. This fix avoids
> > duplicating the prefix in these situations.
> > 
> If the scripts expects the layer name to not have a meta- prefix,
> should it also strip a prefix if its present before passing it to
> yocto_layer_create()?
I'm failing to understand the question, I think the
yocto_layer_create() is receiving a layer_output_dir argument with
'meta-' checked to not be duplicated.  The fix is right above the
yocto_layer_create() call.
> Ross

> -- 
> _______________________________________________
> Openembedded-core mailing list
> 
Openembedded-core@lists.openembedded.org> 
http://lists.openembedded.org/mailman/listinfo/openembedded-core> 

--=-LQiWWFk+IxpeMuBiXxoX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Thu, 2015-07-30 at 14:28 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On 29 July 2015 at 20:50,  <span dir="ltr">&lt;<a href="mailto:humberto.ibarra.lopez@intel.com" target="_blank">humberto.ibarra.lopez@intel.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":ic" class="a3s" style="overflow:hidden">The yocto-layer script puts an extra "meta-" prefix to the given layer<br>
name even when the prefix is already there. This fix avoids<br>
duplicating the prefix in these situations.</div><br></blockquote><div><br></div><div>If the scripts expects the layer name to not have a meta- prefix, should it also strip a prefix if its present before passing it to yocto_layer_create()?</div></div></div></div></blockquote><div>I'm failing to understand the question, I think the yocto_layer_create() is receiving a layer_output_dir argument with 'meta-' checked to not be duplicated. &nbsp;The fix is right above the yocto_layer_create() call.</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><div class="gmail_quote"><div>Ross</div></div></div></div>
<pre>-- 
_______________________________________________
Openembedded-core mailing list
<a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre></blockquote></body></html>

--=-LQiWWFk+IxpeMuBiXxoX--
