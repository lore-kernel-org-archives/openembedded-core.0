Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SGEPm-0004xv-IS
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 21:01:42 +0200
Received: by dadz8 with SMTP id z8so3097296dad.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=VM1RQINwOQ/iYuDSqjzUYQumDPH2lb1Z93FIzgA4M9E=;
	b=UM72QcLGzLZEQItmZDIGATmb1tsd0+Q1cmJedE65rFTb7nubdzVoqRzt1M8jqv20aD
	qX0NLk0PtVVO7pc9N8rISm24GOZbOfiPv+vqzIMCaQzx/EN25Vd+lmyUCYTC5Jxh+eAT
	evwTnHBVbukeZQxkgjNMX3B00bHSnYJRp2E8zcpbdPfFKRQbDePHjpI0PiNg8SEsj6/l
	XRi0TbskIBD60wMjM3UG5LNj0tKHUJxEncQxw00SXKSdf0KzU3mZ2KL+3aMMfDdcY431
	rwd3yIXLC6gb3o5ShmZncgQk317vkawqcrVZlPSqZwtijeZMHlZa3uJiRs4C4vU+PJpe
	i7pQ==
Received: by 10.68.229.230 with SMTP id st6mr14364750pbc.71.1333738348685;
	Fri, 06 Apr 2012 11:52:28 -0700 (PDT)
Received: from frey.local (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id r10sm6963141pbf.22.2012.04.06.11.52.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 11:52:27 -0700 (PDT)
Date: Fri, 6 Apr 2012 11:52:25 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <130E6E43FAB0417FBB8B0CB0AACEB9A2@gmail.com>
In-Reply-To: <CAP9ODKoy9qiWiTYT7=Jz2huPRwvYJjmLs+R27GkFJj6pM7bXrQ@mail.gmail.com>
References: <CAP9ODKodLVh6Njh2eZrckJBk+1qaJ7QbssFmCfty+gowXyrsRA@mail.gmail.com>
	<BE831345A714428CA4205A5C517FF2AC@gmail.com>
	<CAP9ODKoy9qiWiTYT7=Jz2huPRwvYJjmLs+R27GkFJj6pM7bXrQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 06 Apr 2012 19:01:43 -0000
Content-Type: multipart/alternative; boundary="4f7f3b69_625558ec_6cfe"

--4f7f3b69_625558ec_6cfe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

See the thread "Re-execution of tasks - test report and results" for further information.

-- 
Christopher Larson


On Friday, April 6, 2012 at 11:49 AM, Otavio Salvador wrote:

> On Fri, Apr 6, 2012 at 15:48, Christopher Larson <kergoth@gmail.com (mailto:kergoth@gmail.com)> wrote:
> > Have you seen the other threads on the subject? Further, I don't think
> > rm_work is an ideal fix, considering its problematic interactions with
> > sstate in the past, unless those have been fixed?
> > 
> 
> 
> I didn't see. The right fix would be the PRServer but from my last
> test it seems not ready for use yet. I had some wierd failures with
> git based recipes.
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



--4f7f3b69_625558ec_6cfe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>See the thread =22Re-execution of tasks - test report and results=22 =
for further information.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On =46riday, April 6, =
2012 at 11:49 AM, Otavio Salvador wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>On =46ri, Apr 6, 2012 at 15:48, =
Christopher Larson &lt;<a href=3D=22mailto:kergoth=40gmail.com=22>kergoth=
=40gmail.com</a>&gt; wrote:</div><blockquote type=3D=22cite=22><div><div>=
Have you seen the other threads on the subject=3F =46urther, I don't thin=
k</div><div>rm=5Fwork is an ideal fix, considering its problematic intera=
ctions with</div><div>sstate in the past, unless those have been fixed=3F=
</div></div></blockquote><div><br></div><div>I didn't see. The right fix =
would be the PRServer but from my last</div><div>test it seems not ready =
for use yet. I had some wierd failures with</div><div>git based recipes.<=
/div><div><br></div><div>-- </div><div>Otavio Salvador&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;O.S. Systems</div><div>E-mail: otavio=40ossystems.com.br&nbsp=
; <a href=3D=22http://www.ossystems.com.br=22>http://www.ossystems.com.br=
</a></div><div>Mobile: +55 53 9981-7854&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;<a href=3D=22http://projetos.ossystems.com.br=22>http=
://projetos.ossystems.com.br</a></div><div><br></div><div>=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedde=
d-core mailing list</div><div><a href=3D=22mailto:Openembedded-core=40lis=
ts.openembedded.org=22>Openembedded-core=40lists.openembedded.org</a></di=
v><div><a href=3D=22http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/o=
penembedded-core=22>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/o=
penembedded-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4f7f3b69_625558ec_6cfe--
