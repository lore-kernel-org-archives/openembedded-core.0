Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SXMH7-0001g0-Vt
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:51:34 +0200
Received: by pbbrq2 with SMTP id rq2so9634645pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 17:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=D/WFB90wt+kDhToflglj76F+aiKA/aUh1plKm1J1TlU=;
	b=u+yw7k4A0XjocZNW0KzpqRtYtciIX9Ys1AOyY7HTJyaVhTReMycY50GxTZBDPhwkwj
	rcC0UBevzJZqc1V4oHhd7/mj2qasODxxZbNPWg8F2vpbR4y6iRU3GpVWs08DvkYux+kr
	A8ST+bnaKC5FWC5nIvL+Wp0ucypfjZIEBFfqpVwLE7IBLsgK0ahDL9V1Dlk4lSLoQWWm
	kVklkPNChZ7wYvHgtGQPNkNFASnuO3yTczCh90uymX4XD5uEoMzy9DX+Ix0Zz7yDTtVs
	wA7uUFM1FjA/4mQ1Wk+prZ5wYZ3hHZCCflt7n/X5IBJL1wdvpduUFyxMZYXkFqtt0ll8
	0nig==
Received: by 10.68.227.5 with SMTP id rw5mr15916990pbc.32.1337820082474;
	Wed, 23 May 2012 17:41:22 -0700 (PDT)
Received: from [192.168.1.132] (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id ou5sm3506538pbb.54.2012.05.23.17.41.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 17:41:20 -0700 (PDT)
Date: Wed, 23 May 2012 17:41:18 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <877EAB77D3024A2AB2CCF0C65D620190@gmail.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
X-Mailer: sparrow 1.6 (build 1081.27)
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Sanity class clean ups
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
X-List-Received-Date: Thu, 24 May 2012 00:51:34 -0000
Content-Type: multipart/alternative; boundary="4fbd83ae_507ed7ab_104a4"

--4fbd83ae_507ed7ab_104a4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This series looks quite sane to me. Nicely done.

-- 
Christopher Larson


On Wednesday, May 23, 2012 at 5:02 PM, Joshua Lock wrote:

> My recent change to the sanity class to warn users when they don't have R/W
> permission to their SSTATE_CACHE directory has caused at least a couple of users
> trouble, including the Yocto project autobuilder.
> 
> I have been unable to reproduce the issue but after discussionwith Elizabeth and
> Chris on #yocto I came up with the following series.
> 
> The series includes a revert my original change as it seems the simple logic has
> severla edge cases. I replace it later in the series with a simple piggy-back
> on the existing check_create_long_filename() call, where I make the suggestion
> of using SSTATE_MIRRORS if that call fails with "Permission denied" when called
> against SSTATE_DIR. This check has been in use for some time and, to the best of
> my knowledge, doesn't trigger invalid failures.
> 
> Thanks to Chris and Elizabeth for pointers as to why this was failing.
> 
> Cheers,
> 
> Joshua
> 
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
> 
> tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
> 
> are available in the git repository at:
> git://git.openembedded.org/openembedded-core-contrib (http://git.openembedded.org/openembedded-core-contrib) josh/sanity
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/sanity
> 
> Joshua Lock (7):
> Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
> sanity.bbclass: copy the data store and finalise before running
> checks
> sanity.bbclass: data.getVar(VAR, obj, exp) -> obj.getVar(VAR, exp)
> sanity.bbclass: add newline to check_create_long_filename failure
> message
> sanity.bbclass: add extra information when SSTATE_CACHE unusable
> sanity.bbclass: catch an extra exception in
> check_create_long_filename
> sanity.bbclass: check sanity at BuildStarted rather than ConfigParsed
> 
> meta/classes/sanity.bbclass | 153 ++++++++++++++++++++++---------------------
> 1 files changed, 78 insertions(+), 75 deletions(-)
> 
> -- 
> 1.7.7.6
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4fbd83ae_507ed7ab_104a4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>This series looks quite sane to me. Nicely done.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Wednesday, May 23, =
2012 at 5:02 PM, Joshua Lock wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>My recent change to the sanity c=
lass to warn users when they don't have R/W</div><div>permission to their=
 SSTATE=5FCACHE directory has caused at least a couple of users</div><div=
>trouble, including the Yocto project autobuilder.</div><div><br></div><d=
iv>I have been unable to reproduce the issue but after discussionwith Eli=
zabeth and</div><div>Chris on =23yocto I came up with the following serie=
s.</div><div><br></div><div>The series includes a revert my original chan=
ge as it seems the simple logic has</div><div>severla edge cases. I repla=
ce it later in the series with a simple piggy-back</div><div>on the exist=
ing check=5Fcreate=5Flong=5Ffilename() call, where I make the suggestion<=
/div><div>of using SSTATE=5FMIRRORS if that call fails with =22Permission=
 denied=22 when called</div><div>against SSTATE=5FDIR. This check has bee=
n in use for some time and, to the best of</div><div>my knowledge, doesn'=
t trigger invalid failures.</div><div><br></div><div>Thanks to Chris and =
Elizabeth for pointers as to why this was failing.</div><div><br></div><d=
iv>Cheers,</div><div><br></div><div>Joshua</div><div><br></div><div>The f=
ollowing changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:</=
div><div><br></div><div>  tune-mips64.inc: Add new tune file for mips64 b=
ig-endian (2012-05-20 20:24:37 -0700)</div><div><br></div><div>are availa=
ble in the git repository at:</div><div>  git://<a href=3D=22http://git.o=
penembedded.org/openembedded-core-contrib=22>git.openembedded.org/openemb=
edded-core-contrib</a> josh/sanity</div><div>  <a href=3D=22http://cgit.o=
penembedded.org/cgit.cgi/openembedded-core-contrib/log/=3Fh=3Djosh/sanity=
=22>http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=3F=
h=3Djosh/sanity</a></div><div><br></div><div>Joshua Lock (7):</div><div> =
 Revert =22sanity.bbclass: check user can read and write to SSTATE=5FDIR=22=
</div><div>  sanity.bbclass: copy the data store and finalise before runn=
ing</div><div>    checks</div><div>  sanity.bbclass: data.getVar(VAR, obj=
, exp) -&gt; obj.getVar(VAR, exp)</div><div>  sanity.bbclass: add newline=
 to check=5Fcreate=5Flong=5Ffilename failure</div><div>    message</div><=
div>  sanity.bbclass: add extra information when SSTATE=5FCACHE unusable<=
/div><div>  sanity.bbclass: catch an extra exception in</div><div>    che=
ck=5Fcreate=5Flong=5Ffilename</div><div>  sanity.bbclass: check sanity at=
 BuildStarted rather than ConfigParsed</div><div><br></div><div> meta/cla=
sses/sanity.bbclass =7C  153 ++++++++++++++++++++++---------------------<=
/div><div> 1 files changed, 78 insertions(+), 75 deletions(-)</div><div><=
br></div><div>-- </div><div>1.7.7.6</div><div><br></div><div><br></div><d=
iv>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</di=
v><div>Openembedded-core mailing list</div><div><a href=3D=22mailto:Opene=
mbedded-core=40lists.openembedded.org=22>Openembedded-core=40lists.openem=
bedded.org</a></div><div><a href=3D=22http://lists.linuxtogo.org/cgi-bin/=
mailman/listinfo/openembedded-core=22>http://lists.linuxtogo.org/cgi-bin/=
mailman/listinfo/openembedded-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4fbd83ae_507ed7ab_104a4--
