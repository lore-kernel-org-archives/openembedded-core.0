Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SGELp-0004Vw-NE
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 20:57:38 +0200
Received: by pbcum15 with SMTP id um15so2380428pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=mDlpq55709KvzA7I0q5A7qsN3jV3LPbyEcugL4bWorA=;
	b=it5kgG+9XljOGVf11++MQkadLgurF3lvM3gHcvOtvdjwbS55242HGV+9DfjuLEKk0p
	Or93ZJU1AvFdbAz/espFAl4fUYvZJE/qN4d1uKBb1ar1Ji//1jHv38DbnM71DiCEh6ov
	8xZ2EEHhhwKEfDsATPJE/FviZAHaXzYlODQLVcnXTeDIxKPP7XiYu11i1KfswkvFUFRB
	YxCVTXclTfR5QrNGtbYtzcybUgaU/yfZj5FE/2VF1bKAXmJEatjP2y7FvfM04QF3Bwst
	FNYBeSyjhPq70vkuX5AnIvkBC7/2G87TzleOl3ndsh8232tjqhCPJftLSg4wt0ENoAHp
	HWbw==
Received: by 10.68.189.106 with SMTP id gh10mr3535011pbc.54.1333738103515;
	Fri, 06 Apr 2012 11:48:23 -0700 (PDT)
Received: from frey.local (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id f4sm6949424pbg.56.2012.04.06.11.48.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 11:48:22 -0700 (PDT)
Date: Fri, 6 Apr 2012 11:48:20 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <BE831345A714428CA4205A5C517FF2AC@gmail.com>
In-Reply-To: <CAP9ODKodLVh6Njh2eZrckJBk+1qaJ7QbssFmCfty+gowXyrsRA@mail.gmail.com>
References: <CAP9ODKodLVh6Njh2eZrckJBk+1qaJ7QbssFmCfty+gowXyrsRA@mail.gmail.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: Problems with rebuilds caused by sstate cache changes
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
X-List-Received-Date: Fri, 06 Apr 2012 18:57:38 -0000
Content-Type: multipart/alternative; boundary="4f7f3a74_74b0dc51_6cfe"

--4f7f3a74_74b0dc51_6cfe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Have you seen the other threads on the subject? Further, I don't think rm_work is an ideal fix, considering its problematic interactions with sstate in the past, unless those have been fixed?

-- 
Christopher Larson


On Friday, April 6, 2012 at 11:45 AM, Otavio Salvador wrote:

> Hello,
> 
> I've been getting a fairly big number of build failures caused by ${S}
> being reuse for rebuild. Those happen, most of time, when I sync our
> repository with OE-Core and other layers.
> 
> The failures are caused by same source being reuse for two or more
> builds, without PR bump. So patching fails, file rename fails, file
> removal fails and so on.
> 
> For the Yocto upcoming release it might be a big problem since they're
> using OEBasicHash by default but not being catch by this because their
> autobuilders /remove/ their tmp dir from time to time. I don't!
> 
> I think Yocto ought to use rm_work by default for now to workaround
> the issue. Thoughts?
> 
> -- 
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4f7f3a74_74b0dc51_6cfe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>Have you seen the other threads on the subject=3F =46urther, I don't =
think rm=5Fwork is an ideal fix, considering its problematic interactions=
 with sstate in the past, unless those have been fixed=3F<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On =46riday, April 6, =
2012 at 11:45 AM, Otavio Salvador wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>Hello,</div><div><br></div><div>=
I've been getting a fairly big number of build failures caused by =24=7BS=
=7D</div><div>being reuse for rebuild. Those happen, most of time, when I=
 sync our</div><div>repository with OE-Core and other layers.</div><div><=
br></div><div>The failures are caused by same source being reuse for two =
or more</div><div>builds, without PR bump. So patching fails, file rename=
 fails, file</div><div>removal fails and so on.</div><div><br></div><div>=
=46or the Yocto upcoming release it might be a big problem since they're<=
/div><div>using OEBasicHash by default but not being catch by this becaus=
e their</div><div>autobuilders /remove/ their tmp dir from time to time. =
I don't=21</div><div><br></div><div>I think Yocto ought to use rm=5Fwork =
by default for now to workaround</div><div>the issue. Thoughts=3F</div><d=
iv><br></div><div>-- </div><div>Otavio Salvador&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;O.S. Systems</div><div>E-mail: otavio=40ossystems.com.br&nbsp; <a hr=
ef=3D=22http://www.ossystems.com.br=22>http://www.ossystems.com.br</a></d=
iv><div>Mobile: +55 53 9981-7854&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp;<a href=3D=22http://projetos.ossystems.com.br=22>http://proj=
etos.ossystems.com.br</a></div><div><br></div><div>=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedded-core ma=
iling list</div><div><a href=3D=22mailto:Openembedded-core=40lists.openem=
bedded.org=22>Openembedded-core=40lists.openembedded.org</a></div><div><a=
 href=3D=22http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-core=22>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4f7f3a74_74b0dc51_6cfe--
