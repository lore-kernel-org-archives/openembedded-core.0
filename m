Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5233F7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 13:15:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id q16so6219823wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fr8fUMa0xQ8HOuVlyRFiTKU55YWguiVxni1rhDwr1QU=;
	b=XSEswtUNbWpknjj/biwenvF6qPzUPbwsGi7griA3g1GVFi92LoUuQIiROfeEUWGwZG
	S66Uo1zbJfgBUgCkcBAN35kjTBkrbad4vc2OxEQY++p6C6QR2dSdpv3i9q9vxMOB9oGW
	YqeizxZTE+X+x1nCfhq4E0VMcycciVBnfJlLYANHY2uS3gPuDAZRPvQIvFiMUQGYfjwJ
	816vrz4HkCAkHz5aTbl/tg7H7GBeuEEsDGvcs+vjKG3r8XQ1+BPjzwPRmm/ka/Q1Jh8Q
	KlVxYfpxlSJTve5ghgEebevCDdSjI1Vbj1B7jpejeJa9gxrmZ7ucxZmFxLRUEOnV/SV7
	UcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fr8fUMa0xQ8HOuVlyRFiTKU55YWguiVxni1rhDwr1QU=;
	b=WGPu9E7kD2XH0Q5LV16rS5gm8v/ehE3KzPEHMVQTWwg2TtIdx09H2GppHDBYoYr/1F
	BRYgTNrAbOBCU8QVGyEm7u4vZ5bCKaf7fQ9RxTo5d101Ga/Sw/TV7tAPFXctRrQo4ryr
	cHCLOIiImwsAYqQP+St1bpH/W+5K+rIXNKZVCx3QFS7FYXSmVIrypU85YXKKSLiXKGsh
	WQqFcR/pcvd9NocPnsJ7qjSa5CJzboGnbtRpcKUrD8qYuSV9esEd+SgckiPtFmjnz8Tf
	QG8WaHmRDXSgt5RUVQTKtAeMUvr7sVSOSeI6d66vB8N9w5KDf8wbY5gOaTGrNezEtz5B
	3V5w==
X-Gm-Message-State: APjAAAW+K2+yZoHsavAZixyI+yQ8t5tatGVw1N9BMmG2MQQb27QMNwo+
	5u04f5dQLS2QNeNbRfvtbD4goSJ7JCOjKsWdX1w=
X-Google-Smtp-Source: APXvYqy+/J8Kk7X5RMy76DwpQxknQLz+MitfpgV+ysgnD0jW/LPezkU1etasfYmVxz4MfKGY7GG/NiC0WghExmFeJMk=
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr2609193wmc.76.1555679710942; 
	Fri, 19 Apr 2019 06:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190419025718.15348-1-JPEWhacker@gmail.com>
	<20190419025718.15348-3-JPEWhacker@gmail.com>
	<647cdc97-99f4-9ed2-9305-ad50b4a53c52@gmail.com>
In-Reply-To: <647cdc97-99f4-9ed2-9305-ad50b4a53c52@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 19 Apr 2019 08:14:58 -0500
Message-ID: <CAJdd5GYb6hftsv6tnjFuQeudmp++zdMLLWzoXTCP1KT4130MRw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] resulttool: Add log subcommand
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
X-List-Received-Date: Fri, 19 Apr 2019 13:15:10 -0000
Content-Type: multipart/alternative; boundary="0000000000008e19170586e1e801"

--0000000000008e19170586e1e801
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 19, 2019, 12:05 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/18/19 7:57 PM, Joshua Watt wrote:
> > Adds a subcommand for dumping various logs from test results
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  scripts/lib/resulttool/log.py        | 56 ++++++++++++++++++++++++++++
> >  scripts/lib/resulttool/regression.py |  2 +-
> >  scripts/resulttool                   |  2 +
> >  3 files changed, 59 insertions(+), 1 deletion(-)
> >  create mode 100644 scripts/lib/resulttool/log.py
> >
> > diff --git a/scripts/lib/resulttool/log.py
> b/scripts/lib/resulttool/log.py
> > new file mode 100644
> > index 00000000000..5584f2d0a99
> > --- /dev/null
> > +++ b/scripts/lib/resulttool/log.py
> > @@ -0,0 +1,56 @@
> > +# resulttool - Show logs
> > +#
> > +# Copyright (c) 2019 Garmin International
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> it
> > +# under the terms and conditions of the GNU General Public License,
> > +# version 2, as published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope it will be useful, but WITHOUT
> > +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > +# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> > +# more details.
> > +#
> > +import resulttool.resultutils as resultutils
> > +
> > +def show_ptest(result, ptest, logger):
> > +    if 'ptestresult.sections' in result:
> > +        if ptest in result['ptestresult.sections'] and 'log' in
> result['ptestresult.sections'][ptest]:
> > +            print(result['ptestresult.sections'][ptest]['log'])
> > +            return 0
> > +
> > +    print("ptest '%s' not found" % ptest)
> > +    return 1
> > +
> > +def log(args, logger):
> > +    results = resultutils.load_resultsdata(args.source)
> > +    for path in results:
> > +        for res in results[path]:
> > +            if 'result' not in results[path][res]:
> > +                continue
> > +            r = results[path][res]['result']
> > +
> > +            if args.raw:
> > +                if 'ptestresult.rawlogs' in r:
> > +                    print(r['ptestresult.rawlogs']['log'])
> > +                else:
> > +                    print('Raw logs not found')
> > +                    return 1
> > +
> > +            for ptest in args.ptest:
> > +                if not show_ptest(r, ptest, logger):
> > +                    return 1
> > +
> > +def register_commands(subparsers):
> > +    """Register subcommands from this plugin"""
> > +    parser = subparsers.add_parser('log', help='show logs',
> > +                                         description='show the logs
> from test results',
> > +                                         group='analysis')
> > +    parser.set_defaults(func=log)
> > +    parser.add_argument('source',
> > +            help='the results file/directory/URL to import')
> > +    parser.add_argument('--ptest', action='append', default=[],
> > +            help='show logs for a ptest')
> > +    parser.add_argument('--raw', action='store_true',
> > +            help='show raw logs')
> > +
> > diff --git a/scripts/lib/resulttool/regression.py
> b/scripts/lib/resulttool/regression.py
> > index aecb9da9ce5..fa90ab1e522 100644
> > --- a/scripts/lib/resulttool/regression.py
> > +++ b/scripts/lib/resulttool/regression.py
> > @@ -64,7 +64,7 @@ def regression_common(args, logger, base_results,
> target_results):
> >          if a in target_results:
> >              base = list(base_results[a].keys())
> >              target = list(target_results[a].keys())
> > -            # We may have multiple base/targets which are for different
> configurations. Start by
> > +            # We may have multiple base/targets which are for different
> configurations. Start by
> This change looks the same to me so what am I missing?
>

It stripped off trailing whitespace and I missed removing it when staging.

- Armin
> >              # removing any pairs which match
> >              for c in base.copy():
> >                  for b in target.copy():
> > diff --git a/scripts/resulttool b/scripts/resulttool
> > index 18ac1019236..9477667a870 100755
> > --- a/scripts/resulttool
> > +++ b/scripts/resulttool
> > @@ -49,6 +49,7 @@ import resulttool.store
> >  import resulttool.regression
> >  import resulttool.report
> >  import resulttool.manualexecution
> > +import resulttool.log
> >  logger = scriptutils.logger_create('resulttool')
> >
> >  def main():
> > @@ -66,6 +67,7 @@ def main():
> >      subparsers.add_subparser_group('analysis', 'analysis', 100)
> >      resulttool.regression.register_commands(subparsers)
> >      resulttool.report.register_commands(subparsers)
> > +    resulttool.log.register_commands(subparsers)
> >
> >      args = parser.parse_args()
> >      if args.debug:
>
>
>

--0000000000008e19170586e1e801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 19, 2019, 12:05 AM akuster808 &lt;<a href=
=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
<br>
On 4/18/19 7:57 PM, Joshua Watt wrote:<br>
&gt; Adds a subcommand for dumping various logs from test results<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/resulttool/log.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 56 ++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 scripts/lib/resulttool/regression.py |=C2=A0 2 +-<br>
&gt;=C2=A0 scripts/resulttool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 59 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 scripts/lib/resulttool/log.py<br>
&gt;<br>
&gt; diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/lo=
g.py<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..5584f2d0a99<br>
&gt; --- /dev/null<br>
&gt; +++ b/scripts/lib/resulttool/log.py<br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +# resulttool - Show logs<br>
&gt; +#<br>
&gt; +# Copyright (c) 2019 Garmin International<br>
&gt; +#<br>
&gt; +# This program is free software; you can redistribute it and/or modif=
y it<br>
&gt; +# under the terms and conditions of the GNU General Public License,<b=
r>
&gt; +# version 2, as published by the Free Software Foundation.<br>
&gt; +#<br>
&gt; +# This program is distributed in the hope it will be useful, but WITH=
OUT<br>
&gt; +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or<br>
&gt; +# FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public =
License for<br>
&gt; +# more details.<br>
&gt; +#<br>
&gt; +import resulttool.resultutils as resultutils<br>
&gt; +<br>
&gt; +def show_ptest(result, ptest, logger):<br>
&gt; +=C2=A0 =C2=A0 if &#39;ptestresult.sections&#39; in result:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ptest in result[&#39;ptestresult.secti=
ons&#39;] and &#39;log&#39; in result[&#39;ptestresult.sections&#39;][ptest=
]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(result[&#39;ptestresu=
lt.sections&#39;][ptest][&#39;log&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 print(&quot;ptest &#39;%s&#39; not found&quot; % ptest)=
<br>
&gt; +=C2=A0 =C2=A0 return 1<br>
&gt; +<br>
&gt; +def log(args, logger):<br>
&gt; +=C2=A0 =C2=A0 results =3D resultutils.load_resultsdata(args.source)<b=
r>
&gt; +=C2=A0 =C2=A0 for path in results:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for res in results[path]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;result&#39; not in =
results[path][res]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D results[path][res][&#=
39;result&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.raw:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;ptest=
result.rawlogs&#39; in r:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 print(r[&#39;ptestresult.rawlogs&#39;][&#39;log&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 print(&#39;Raw logs not found&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ptest in args.ptest:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not show_p=
test(r, ptest, logger):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return 1<br>
&gt; +<br>
&gt; +def register_commands(subparsers):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Register subcommands from this plugin=
&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 parser =3D subparsers.add_parser(&#39;log&#39;, help=3D=
&#39;show logs&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0description=3D&#39;show the logs from test results&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0group=3D&#39;analysis&#39;)<br>
&gt; +=C2=A0 =C2=A0 parser.set_defaults(func=3Dlog)<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;source&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;the results fil=
e/directory/URL to import&#39;)<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;--ptest&#39;, action=3D&#39;ap=
pend&#39;, default=3D[],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;show logs for a=
 ptest&#39;)<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;--raw&#39;, action=3D&#39;stor=
e_true&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;show raw logs&#=
39;)<br>
&gt; +<br>
&gt; diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/result=
tool/regression.py<br>
&gt; index aecb9da9ce5..fa90ab1e522 100644<br>
&gt; --- a/scripts/lib/resulttool/regression.py<br>
&gt; +++ b/scripts/lib/resulttool/regression.py<br>
&gt; @@ -64,7 +64,7 @@ def regression_common(args, logger, base_results, ta=
rget_results):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if a in target_results:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D list(base_res=
ults[a].keys())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D list(target=
_results[a].keys())<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We may have multiple base=
/targets which are for different configurations. Start by <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We may have multiple base=
/targets which are for different configurations. Start by<br>
This change looks the same to me so what am I missing?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">It stripped off trail=
ing whitespace and I missed removing it when staging.<br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
- Armin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # removing any pairs w=
hich match<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for c in base.copy():<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for b in=
 target.copy():<br>
&gt; diff --git a/scripts/resulttool b/scripts/resulttool<br>
&gt; index 18ac1019236..9477667a870 100755<br>
&gt; --- a/scripts/resulttool<br>
&gt; +++ b/scripts/resulttool<br>
&gt; @@ -49,6 +49,7 @@ import resulttool.store<br>
&gt;=C2=A0 import resulttool.regression<br>
&gt;=C2=A0 import resulttool.report<br>
&gt;=C2=A0 import resulttool.manualexecution<br>
&gt; +import resulttool.log<br>
&gt;=C2=A0 logger =3D scriptutils.logger_create(&#39;resulttool&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def main():<br>
&gt; @@ -66,6 +67,7 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 subparsers.add_subparser_group(&#39;analysis&#39;,=
 &#39;analysis&#39;, 100)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 resulttool.regression.register_commands(subparsers=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 resulttool.report.register_commands(subparsers)<br=
>
&gt; +=C2=A0 =C2=A0 resulttool.log.register_commands(subparsers)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 args =3D parser.parse_args()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if args.debug:<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000008e19170586e1e801--
