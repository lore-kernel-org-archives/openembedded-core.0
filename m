Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 66C2A77163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 20:28:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 13:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,690,1437462000"; 
	d="scan'208,217";a="828807964"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.128.95])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2015 13:28:06 -0700
Message-ID: <1445027286.6970.34.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANkYQD8esrYrhDWZdiXnp5tEdemmh0cGyqpGWX_zA_t5fA@mail.gmail.com>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CABcZANkYQD8esrYrhDWZdiXnp5tEdemmh0cGyqpGWX_zA_t5fA@mail.gmail.com>
Organization: Intel Corporation
Date: Fri, 16 Oct 2015 15:28:06 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Fri, 16 Oct 2015 20:28:07 -0000
Content-Type: multipart/alternative; boundary="=-l1jKpp85VYgqnvCCeEhF"

--=-l1jKpp85VYgqnvCCeEhF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-15 at 19:15 -0700, Christopher Larson wrote:
> 
> On Thu, Oct 15, 2015 at 10:27 AM, Benjamin Esquivel <
> benjamin.esquivel@linux.intel.com> wrote:
> > +    def movefile(self, sourcefile, destdir):
> > +        try:
> > +            # FIXME: this check of movefile's return code to None
> > should be
> > +            # fixed within the function to use only exceptions to
> > signal when
> > +            # something goes wrong
> > +            if (bb.utils.movefile(sourcefile, destdir) == None):
> > +                raise Exception("moving {} to {} failed".format(
> > +                                        sourcefile, destdir))
> > +        except Exception as e:
> > +            bb.warn(str(e))
> > +            bb.error("unable to place {} in final SDK
> > location".format(
> > +                        sourcefile))
> > +
> > +    def mkdirhier(self, dirpath):
> > +        try:
> > +            bb.utils.mkdirhier(dirpath)
> > +        except OSError as e:
> > +            bb.warn(str(e))
> > +            bb.error("cannot make dir for SDK:
> > {}".format(dirpath))
> > 
> Shouldn't this be fatal?
correct, will change to fatal. Thanks.

--=-l1jKpp85VYgqnvCCeEhF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Thu, 2015-10-15 at 19:15 -0700, Christopher Larson wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Thu, Oct 15, 2015 at 10:27 AM, Benjamin Esquivel <span dir="ltr">&lt;<a href="mailto:benjamin.esquivel@linux.intel.com" target="_blank">benjamin.esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":1fa" class="a3s" style="overflow:hidden">+&nbsp; &nbsp; def movefile(self, sourcefile, destdir):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; try:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # FIXME: this check of movefile's return code to None should be<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # fixed within the function to use only exceptions to signal when<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # something goes wrong<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (bb.utils.movefile(sourcefile, destdir) == None):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; raise Exception("moving {} to {} failed".format(<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sourcefile, destdir))<br>
+&nbsp; &nbsp; &nbsp; &nbsp; except Exception as e:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.warn(str(e))<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.error("unable to place {} in final SDK location".format(<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sourcefile))<br>
+<br>
+&nbsp; &nbsp; def mkdirhier(self, dirpath):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; try:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.mkdirhier(dirpath)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; except OSError as e:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.warn(str(e))<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.error("cannot make dir for SDK: {}".format(dirpath))</div><br></blockquote></div><br>Shouldn't this be fatal?<br></div></div></blockquote><div>correct, will change to fatal. Thanks.</div></body></html>

--=-l1jKpp85VYgqnvCCeEhF--
