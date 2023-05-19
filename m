Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90B4C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 13:12:18 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.25949.1684501932204086657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 06:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kI59l6n4;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2af28a07be9so3238751fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684501930; x=1687093930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zP2la3dWaEl1kikLDoWw6qo0EQiwZRMZMj7TXuppi5o=;
        b=kI59l6n4ogAAq+zm3ssWg8VwqGU6Mw5feoPi7wL8fmYUQxtOt4yA5LXRjuHZs4d3X9
         ifRVj56y+QC1E5pf9MQDazmU3tVVNXORiFl3oc9LICOxpNRAVevCzvWAqDr1/9h1fIrt
         S/0bIwf1UaBhcT9Radjnd6rMwLa/JeKSPJc0zwKhBH+ZfzUtF2/sXz2aDvjUGhMeAo6e
         L3p/iM2a7a/ngF+I99t4sMZw7qVGCTkO3hdyiavPoi34U+5ZKv4QIiC/RIHOGHWB+Rgg
         /0YirKXfV/9EhQ0Pul7DJuIlrv8HuXwKECfgGGFQykqlTONZSmY9xNdnUxgP/eq5pFAQ
         0vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501930; x=1687093930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zP2la3dWaEl1kikLDoWw6qo0EQiwZRMZMj7TXuppi5o=;
        b=eVJwqYw7aW0G+g5RIkoqYsMhIF/0xfFremNhDttdSofqw4YIiR7hrd6//bOUlLrYjB
         EMdihJm5eM1LZEJcBpUJcctoBv3cUGl0pp41EBHZnx9Eg3U+l7HaoF7y88Ix8UxqATmj
         loJf2KAd1cPFcTpbp6eIFsm/kogYDIu5Czk87qgVrRQo/P+LEjgz0WZFYAnDU3Ah6MCX
         wU2L47uPG14KJNqasSn7WhmTl50Ozq/OsqIzuFMntrXBXojUn++B0rBuEcshlzVefu2J
         zIcgNOlaA4cduBht1JiyXLXIBvVJIF5Iq/exjzWz9cvXBz/Z3HnjBat/lvjES94j2Xq3
         cGDQ==
X-Gm-Message-State: AC+VfDxqB7sJiHgNnp9u+wCpzCbKZBxOIFClvg44voo43BTqu0YG4jXi
	Jw7rQOv/+Oqe1CslQU/WuRC1BsQQPENVvgLlUcs=
X-Google-Smtp-Source: ACHHUZ4+B4JBLpJPZMffpFpCtVemyngY0zI9xKA/fiEhysnp5bt2otZlqm2XiBtFmh+ixz4hPI5J92HT6g9PdiFzQM8=
X-Received: by 2002:a2e:2417:0:b0:2a2:47a8:728b with SMTP id
 k23-20020a2e2417000000b002a247a8728bmr809503ljk.13.1684501929859; Fri, 19 May
 2023 06:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230505111814.491483-1-andrej.valek@siemens.com> <20230519062420.37015-1-andrej.valek@siemens.com>
In-Reply-To: <20230519062420.37015-1-andrej.valek@siemens.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 19 May 2023 15:11:57 +0200
Message-ID: <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
To: andrej.valek@siemens.com
Cc: openembedded-core@lists.openembedded.org, mikko.rapeli@linaro.org, 
	Peter Marko <peter.marko@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000271e1105fc0babea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 13:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181550

--000000000000271e1105fc0babea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for this work. I think we are going in a good direction. My
comments in the text.

In general, I would like that we come with the fixed list of possible
statuses and avoid adding new ones too frequently. Changing them will break
my parsing and status scripts each time.


On Fri, May 19, 2023 at 8:24=E2=80=AFAM Andrej Valek via lists.openembedded=
.org
<andrej.valek=3Dsiemens.com@lists.openembedded.org> wrote:

> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
> more flexible. CVE_STATUS should contain flag for each CVE with accepted
> values "Ignored", "Not applicable" or "Patched". It allows to add
> a status for each CVEs.
>

I'm missing a status to cover the situation when the NVD (or any other
database) has an incorrect entry. We have quite many of those. This might
be a temporary situation, but not always.

SPDX (the 3.0 draft) has some other possible reasons
https://github.com/spdx/spdx-spec/blob/vulnerability-profile/chapters/profi=
le-vulnerabilities.md
What looks like interesting ideas are:
* "Can't fix" / "Will not fix"
* "Not applicable" (SPDX language: Ineffective) when the code is not used
* "Invalid match" (this is our NVD mismatch case)
* "Mitigated" measures taken so that it cannot be exploited
* "Workarounded"

There is still one big missing part: related to configuration options. It
could be used with "Not applicable"/"Ineffective" code, but only in cases
where it is not possible to activate the code. If the user can switch
between vulnerable/not vulnerable versions by a packageconfig change or so,
this is not covered.

Addiional question: why CVE_STATUS_REASONING and not CVE_STATUS_REASON ?
(reason variable is used nearly everywhere)


> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index bd9e7e7445c..44462de7445 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -70,12 +70,15 @@ CVE_CHECK_COVERAGE ??=3D "1"
>  # Skip CVE Check for packages (PN)
>  CVE_CHECK_SKIP_RECIPE ?=3D ""
>
> -# Ingore the check for a given list of CVEs. If a CVE is found,
> -# then it is considered patched. The value is a string containing
> -# space separated CVE values:
> +# Replace NVD DB check status for a given CVE. Each of CVE has to be
> mentioned
> +# separately with optional reason for this status.
>  #
> -# CVE_CHECK_IGNORE =3D 'CVE-2014-2524 CVE-2018-1234'
> +# CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Not applicable" or "Patc=
hed"
> +# CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
> +# CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on Windows=
"
>  #
> +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
> +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
>  CVE_CHECK_IGNORE ?=3D ""
>
>  # Layers to be excluded
> @@ -88,6 +91,25 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>  # set to "alphabetical" for version using single alphabetical character
> as increment release
>  CVE_VERSION_SUFFIX ??=3D ""
>
> +python () {
> +    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
> +    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
> +    if cve_check_ignore:
> +        bb.warn("CVE_CHECK_IGNORE has been deprecated, use CVE_STATUS
> instead")
> +        set_cves_statuses(d, d.getVar("CVE_CHECK_IGNORE"), "Ignored")
> +
> +    # Process CVE_STATUS_GROUPS to set multiple statuses and optional
> reasons at once
> +    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split(=
):
> +        set_cves_statuses(d, d.getVar(cve_status_group) or "",
> +                          d.getVarFlag(cve_status_group, "status"),
> +                          d.getVarFlag(cve_status_group, "reason"))
> +}
> +
> +def set_cves_statuses(d, cves, status, reason=3D""):
> +    for cve in cves.split():
> +        d.setVarFlag("CVE_STATUS", cve, status)
> +        d.setVarFlag("CVE_STATUS_REASONING", cve, reason)
> +
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> @@ -282,7 +304,13 @@ def check_cves(d, patched_cves):
>          bb.note("Recipe has been skipped by cve-check")
>          return ([], [], [], [])
>
> -    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
> +    # Convert CVE_STATUS into ignored CVEs and check validity
> +    cve_ignore =3D []
> +    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
> +        if status in ["Not applicable", "Ignored"]:
> +            cve_ignore.append(cve)
> +        elif status not in ["Patched"]:
> +            bb.error("Unsupported status %s in CVE_STATUS[%s]" % (status=
,
> cve))
>
I do not see this entry added into the "Patched" list.

IMO would be better to handle Patched separately, and so a complete "else"
for all other reasons. Allows to avoid hard-coding all possible options.


>
>      import sqlite3
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> @@ -455,6 +483,9 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>          else:
>              unpatched_cves.append(cve)
>              write_string +=3D "CVE STATUS: Unpatched\n"
> +        reasoning =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
> +        if reasoning:
> +            write_string +=3D "CVE REASON: %s\n" % reasoning
>

Do we want adding new features to the (deprecated) text output?

Kind regards,
Marta

>
>

--000000000000271e1105fc0babea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for this work. I think we are going in a go=
od direction. My comments in the text.</div><div><br></div><div>In general,=
 I would like that we come with <span class=3D"ng" style=3D"background:rgba=
(0,0,0,0) none repeat scroll 0% 0%!important">the</span> fixed list of poss=
ible statuses and avoid adding new ones too frequently. Changing them will =
break my parsing and status scripts each time.<br></div><div dir=3D"ltr"><b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, May 19, 2023 at 8:24=E2=80=AFAM Andrej Valek via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;andrej.valek=3D<a =
href=3D"mailto:siemens.com@lists.openembedded.org">siemens.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">- Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONI=
NG] to be<br>
more flexible. CVE_STATUS should contain flag for each CVE with accepted<br=
>
values &quot;Ignored&quot;, &quot;Not applicable&quot; or &quot;Patched&quo=
t;. It allows to add<br>
a status for each CVEs.<br></blockquote><div><br></div><div>I&#39;m missing=
 a status to cover the situation when the NVD (or any other database) has a=
n incorrect entry. We have quite many of those. This might be a temporary s=
ituation, but not always.</div><div><br></div><div>SPDX (the 3.0 draft) has=
 some other possible reasons <a href=3D"https://github.com/spdx/spdx-spec/b=
lob/vulnerability-profile/chapters/profile-vulnerabilities.md">https://gith=
ub.com/spdx/spdx-spec/blob/vulnerability-profile/chapters/profile-vulnerabi=
lities.md</a></div><div>What looks like interesting ideas are:</div><div>* =
&quot;Can&#39;t fix&quot; / &quot;Will not fix&quot;<br></div><div>* &quot;=
Not applicable&quot; (SPDX language: Ineffective) when the code is not used=
</div><div>* &quot;Invalid match&quot; (this is our NVD mismatch case)</div=
><div>* &quot;Mitigated&quot; measures taken so that it cannot be exploited=
</div><div>* &quot;Workarounded&quot;</div><div><br></div><div>There is sti=
ll one big missing part: related to configuration options. It could be used=
 with &quot;Not applicable&quot;/&quot;Ineffective&quot; code, but only in =
cases where it is not possible to activate the code. If the user can switch=
 between vulnerable/not vulnerable versions by a packageconfig change or so=
, this is not covered.</div><div><br></div><div><span class=3D"ng" style=3D=
"background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">Addiional</sp=
an> question: why CVE_STATUS_REASONING and not CVE_STATUS_REASON ? (reason =
variable is used nearly everywhere)<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index bd9e7e7445c..44462de7445 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -70,12 +70,15 @@ CVE_CHECK_COVERAGE ??=3D &quot;1&quot;<br>
=C2=A0# Skip CVE Check for packages (PN)<br>
=C2=A0CVE_CHECK_SKIP_RECIPE ?=3D &quot;&quot;<br>
<br>
-# Ingore the check for a given list of CVEs. If a CVE is found,<br>
-# then it is considered patched. The value is a string containing<br>
-# space separated CVE values:<br>
+# Replace NVD DB check status for a given CVE. Each of CVE has to be menti=
oned<br>
+# separately with optional reason for this status.<br>
=C2=A0#<br>
-# CVE_CHECK_IGNORE =3D &#39;CVE-2014-2524 CVE-2018-1234&#39;<br>
+# CVE_STATUS[CVE-1234-0001] =3D &quot;Ignored&quot; # or &quot;Not applica=
ble&quot; or &quot;Patched&quot;<br>
+# CVE_STATUS[CVE-1234-0002] =3D &quot;Not applicable&quot;<br>
+# CVE_STATUS_REASONING[CVE-1234-0002] =3D &quot;Issue only applies on Wind=
ows&quot;<br>
=C2=A0#<br>
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.<br=
>
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables<br>
=C2=A0CVE_CHECK_IGNORE ?=3D &quot;&quot;<br>
<br>
=C2=A0# Layers to be excluded<br>
@@ -88,6 +91,25 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D &quot;&quot;<br>
=C2=A0# set to &quot;alphabetical&quot; for version using single alphabetic=
al character as increment release<br>
=C2=A0CVE_VERSION_SUFFIX ??=3D &quot;&quot;<br>
<br>
+python () {<br>
+=C2=A0 =C2=A0 # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS<br>
+=C2=A0 =C2=A0 cve_check_ignore =3D d.getVar(&quot;CVE_CHECK_IGNORE&quot;)<=
br>
+=C2=A0 =C2=A0 if cve_check_ignore:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;CVE_CHECK_IGNORE has been deprec=
ated, use CVE_STATUS instead&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_cves_statuses(d, d.getVar(&quot;CVE_CHECK_=
IGNORE&quot;), &quot;Ignored&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Process CVE_STATUS_GROUPS to set multiple statuses and opt=
ional reasons at once<br>
+=C2=A0 =C2=A0 for cve_status_group in (d.getVar(&quot;CVE_STATUS_GROUPS&qu=
ot;) or &quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_cves_statuses(d, d.getVar(cve_status_group=
) or &quot;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 d.getVarFlag(cve_status_group, &quot;status&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 d.getVarFlag(cve_status_group, &quot;reason&quot;))<br>
+}<br>
+<br>
+def set_cves_statuses(d, cves, status, reason=3D&quot;&quot;):<br>
+=C2=A0 =C2=A0 for cve in cves.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&quot;CVE_STATUS&quot;, cve, stat=
us)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&quot;CVE_STATUS_REASONING&quot;,=
 cve, reason)<br>
+<br>
=C2=A0def generate_json_report(d, out_path, link_path):<br>
=C2=A0 =C2=A0 =C2=A0if os.path.exists(d.getVar(&quot;CVE_CHECK_SUMMARY_INDE=
X_PATH&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import json<br>
@@ -282,7 +304,13 @@ def check_cves(d, patched_cves):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Recipe has been skipped by =
cve-check&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ([], [], [], [])<br>
<br>
-=C2=A0 =C2=A0 cve_ignore =3D d.getVar(&quot;CVE_CHECK_IGNORE&quot;).split(=
)<br>
+=C2=A0 =C2=A0 # Convert CVE_STATUS into ignored CVEs and check validity<br=
>
+=C2=A0 =C2=A0 cve_ignore =3D []<br>
+=C2=A0 =C2=A0 for cve, status in (d.getVarFlags(&quot;CVE_STATUS&quot;) or=
 {}).items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if status in [&quot;Not applicable&quot;, &quo=
t;Ignored&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ignore.append(cve)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif status not in [&quot;Patched&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Unsupported statu=
s %s in CVE_STATUS[%s]&quot; % (status, cve))<br></blockquote><div>I do not=
 see this entry added into the &quot;Patched&quot; list.<br></div><div>=C2=
=A0</div><div><span class=3D"ng Vt" style=3D"background:rgba(0,0,0,0) none =
repeat scroll 0% 0%!important">IMO would</span> be better to handle Patched=
 separately, and so a complete &quot;else&quot; for all other reasons. Allo=
ws to avoid hard-coding all possible options.<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0import sqlite3<br>
=C2=A0 =C2=A0 =C2=A0db_file =3D d.expand(&quot;file:${CVE_CHECK_DB_FILE}?mo=
de=3Dro&quot;)<br>
@@ -455,6 +483,9 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unpatched_cves.append(cve)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_string +=3D &quot;CVE=
 STATUS: Unpatched\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reasoning =3D d.getVarFlag(&quot;CVE_STATUS_RE=
ASONING&quot;, cve)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reasoning:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE REAS=
ON: %s\n&quot; % reasoning<br></blockquote><div><br></div><div>Do we want <=
span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0=
%!important">adding</span> new features to the (deprecated) text output?</d=
iv><div><br></div><div>Kind regards,</div><div>Marta<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
</blockquote></div></div>

--000000000000271e1105fc0babea--

