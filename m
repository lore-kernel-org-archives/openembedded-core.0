Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AD8C77B60
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:15:10 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.11180.1682561706305728853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=OXSRrPzh;
 spf=pass (domain: mvista.com, ip: 209.85.208.175, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2a8a6602171so76246421fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 19:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682561704; x=1685153704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+tNMHK2FdeTnYXvjnePksUJRlbSUHZ1AbyRkU8rlcQ=;
        b=OXSRrPzhWl8x5zxCRtY5xUoTHT9rzGL+tYYV1UqoktuluwiX56sFs7VMJ9GO+hSMrd
         JILq/M9lFHTN7AsozeF1w8ZCqBQ0VP8e6Ok9uOiDeN8EOqyaRmfxaXSI+7F/4eiUJb5z
         MLsN01+Z0lEoYhVyScbZnuksv3QYu+vbjfn5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682561704; x=1685153704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+tNMHK2FdeTnYXvjnePksUJRlbSUHZ1AbyRkU8rlcQ=;
        b=ZVQS4Gk3jtz/U9HYWg8FaQzhAAMHf4lx4tkgQuyOA6iwWrQmu7K3mNNQRiW9GkRt3g
         quH6pRDppcbCD30+0oc/Ybm48qL9GOOg4yMdf+deEXGhrfJxrjs/yo1BPvq5vEP7R54H
         sL5tH6AipVJViDG+mjoundZAOpnFg2mmZ1ubqAFA2YeAixJpf7nbQkh+ymM+eqyhaC9z
         zaEa2j9umg0j44eUiTdT0O2ST5nTbmPE/tzgc/S5uDknsnxh9Uos2+3slqpy91XgpC60
         9ao1d1mROpc6Sukjdm6vkJq+X1xvo6MWlQahMNWoEpXQePVb7bY7MJM8nUtr+4/3EuhD
         u34A==
X-Gm-Message-State: AC+VfDw8tx7hAdIZO0KVXli8hcqUlysZXNpT0N+3I0gRH+CXiDYwp/Xv
	A7qQaSNDZBd8Q4rp6Q/3mi4FMq1oeP0kFTyBlJn02w==
X-Google-Smtp-Source: ACHHUZ5oNtAC7LOtfPorkROvnLcjJX894vr6VOIh0rwFy3uK+vQZeeHvAQoMEiCiaIXUINrY/5BLyPq6r6ICKkB0JSw=
X-Received: by 2002:a2e:924a:0:b0:298:acea:d261 with SMTP id
 v10-20020a2e924a000000b00298acead261mr102666ljg.21.1682561704245; Wed, 26 Apr
 2023 19:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230426081745.182677-1-vanusuri@mvista.com> <CAOSpxdYrfr0ovAaV5oTnNGOZKkB_hGFaWT2VnzwC1Hk2g=KKXQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYrfr0ovAaV5oTnNGOZKkB_hGFaWT2VnzwC1Hk2g=KKXQ@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 27 Apr 2023 07:44:52 +0530
Message-ID: <CANQUz1_e-cP_TmBKR+u7RO4fBxbnDn5+c_hZ1dWC8Ua-vzcGQw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: Security fix CVE-2023-27533,
 CVE-2023-27535, CVE-2023-27536 and CVE-2023-27538
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b1cfeb05fa47ecb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180460

--000000000000b1cfeb05fa47ecb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Steve for letting me know

I will submit the v2 patch.

Thanks & Regards,
Vijay

On Wed, Apr 26, 2023 at 9:29=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> Hi Vijay,
>
> We already have a patch for CVE-2023-27538:
>
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3Db=
2740d1ff74b2c55011b5d4230c7b06b5109376d
>
> Could you submit a v2 taking this into consideration?
>
> Thanks for helping with CVEs!
>
> Steve
>
> On Tue, Apr 25, 2023 at 10:18=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.c=
om>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport [
> https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=3Dubu=
ntu/focal-security
> &
> https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0=
684
> &
> https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37=
878
> &
> https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a=
64c
> &
> https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1a=
ba1
> &
> https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56=
ee5
> &
> https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a087=
2eb
> ]
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../curl/curl/CVE-2023-27533.patch            |  59 +++++
> >  .../curl/curl/CVE-2023-27535-pre1.patch       | 236 ++++++++++++++++++
> >  .../curl/curl/CVE-2023-27535.patch            | 170 +++++++++++++
> >  .../curl/curl/CVE-2023-27536.patch            |  55 ++++
> >  .../curl/curl/CVE-2023-27538.patch            |  29 +++
> >  meta/recipes-support/curl/curl_7.69.1.bb      |   5 +
> >  6 files changed, 554 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-27533.patch
> b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
> > new file mode 100644
> > index 0000000000..64ba135056
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
> > @@ -0,0 +1,59 @@
> > +Backport of:
> > +
> > +From 538b1e79a6e7b0bb829ab4cecc828d32105d0684 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Mon, 6 Mar 2023 12:07:33 +0100
> > +Subject: [PATCH] telnet: only accept option arguments in ascii
> > +
> > +To avoid embedded telnet negotiation commands etc.
> > +
> > +Reported-by: Harry Sintonen
> > +Closes #10728
> > +
> > +Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-202=
3-27533.patch?h=3Dubuntu/focal-security
> > +Upstream commit
> https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0=
684
> ]
> > +CVE: CVE-2023-27533
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/telnet.c | 15 +++++++++++++++
> > + 1 file changed, 15 insertions(+)
> > +
> > +--- a/lib/telnet.c
> > ++++ b/lib/telnet.c
> > +@@ -815,6 +815,17 @@ static void printsub(struct Curl_easy *d
> > +   }
> > + }
> > +
> > ++static bool str_is_nonascii(const char *str)
> > ++{
> > ++  size_t len =3D strlen(str);
> > ++  while(len--) {
> > ++    if(*str & 0x80)
> > ++      return TRUE;
> > ++    str++;
> > ++  }
> > ++  return FALSE;
> > ++}
> > ++
> > + static CURLcode check_telnet_options(struct connectdata *conn)
> > + {
> > +   struct curl_slist *head;
> > +@@ -829,6 +840,8 @@ static CURLcode check_telnet_options(str
> > +   /* Add the user name as an environment variable if it
> > +      was given on the command line */
> > +   if(conn->bits.user_passwd) {
> > ++    if(str_is_nonascii(data->conn->user))
> > ++      return CURLE_BAD_FUNCTION_ARGUMENT;
> > +     msnprintf(option_arg, sizeof(option_arg), "USER,%s", conn->user);
> > +     beg =3D curl_slist_append(tn->telnet_vars, option_arg);
> > +     if(!beg) {
> > +@@ -844,6 +857,9 @@ static CURLcode check_telnet_options(str
> > +     if(sscanf(head->data, "%127[^=3D ]%*[ =3D]%255s",
> > +               option_keyword, option_arg) =3D=3D 2) {
> > +
> > ++      if(str_is_nonascii(option_arg))
> > ++        continue;
> > ++
> > +       /* Terminal type */
> > +       if(strcasecompare(option_keyword, "TTYPE")) {
> > +         strncpy(tn->subopt_ttype, option_arg, 31);
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> > new file mode 100644
> > index 0000000000..034b72f7e6
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> > @@ -0,0 +1,236 @@
> > +From ed5095ed94281989e103c72e032200b83be37878 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Thu, 6 Oct 2022 00:49:10 +0200
> > +Subject: [PATCH] strcase: add and use Curl_timestrcmp
> > +
> > +This is a strcmp() alternative function for comparing "secrets",
> > +designed to take the same time no matter the content to not leak
> > +match/non-match info to observers based on how fast it is.
> > +
> > +The time this function takes is only a function of the shortest input
> > +string.
> > +
> > +Reported-by: Trail of Bits
> > +
> > +Closes #9658
> > +
> > +Upstream-Status: Backport from [
> https://github.com/curl/curl/commit/ed5095ed94281989e103c72e032200b83be37=
878
> &
> https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a=
64c
> ]
> > +Comment: to backport fix for CVE-2023-27535, add function
> Curl_timestrcmp.
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/netrc.c             |  6 +++---
> > + lib/strcase.c           | 22 ++++++++++++++++++++++
> > + lib/strcase.h           |  1 +
> > + lib/url.c               | 33 +++++++++++++--------------------
> > + lib/vauth/digest_sspi.c |  4 ++--
> > + lib/vtls/vtls.c         | 21 ++++++++++++++++++++-
> > + 6 files changed, 61 insertions(+), 26 deletions(-)
> > +
> > +diff --git a/lib/netrc.c b/lib/netrc.c
> > +index 9323913..fe3fd1e 100644
> > +--- a/lib/netrc.c
> > ++++ b/lib/netrc.c
> > +@@ -124,9 +124,9 @@ static int parsenetrc(const char *host,
> > +           /* we are now parsing sub-keywords concerning "our" host */
> > +           if(state_login) {
> > +             if(specific_login) {
> > +-              state_our_login =3D strcasecompare(login, tok);
> > ++              state_our_login =3D !Curl_timestrcmp(login, tok);
> > +             }
> > +-            else if(!login || strcmp(login, tok)) {
> > ++            else if(!login || Curl_timestrcmp(login, tok)) {
> > +               if(login_alloc) {
> > +                 free(login);
> > +                 login_alloc =3D FALSE;
> > +@@ -142,7 +142,7 @@ static int parsenetrc(const char *host,
> > +           }
> > +           else if(state_password) {
> > +             if((state_our_login || !specific_login)
> > +-                && (!password || strcmp(password, tok))) {
> > ++               && (!password || Curl_timestrcmp(password, tok))) {
> > +               if(password_alloc) {
> > +                 free(password);
> > +                 password_alloc =3D FALSE;
> > +diff --git a/lib/strcase.c b/lib/strcase.c
> > +index 70bf21c..ec776b3 100644
> > +--- a/lib/strcase.c
> > ++++ b/lib/strcase.c
> > +@@ -261,6 +261,28 @@ bool Curl_safecmp(char *a, char *b)
> > +   return !a && !b;
> > + }
> > +
> > ++/*
> > ++ * Curl_timestrcmp() returns 0 if the two strings are identical. The
> time this
> > ++ * function spends is a function of the shortest string, not of the
> contents.
> > ++ */
> > ++int Curl_timestrcmp(const char *a, const char *b)
> > ++{
> > ++  int match =3D 0;
> > ++  int i =3D 0;
> > ++
> > ++  if(a && b) {
> > ++    while(1) {
> > ++      match |=3D a[i]^b[i];
> > ++      if(!a[i] || !b[i])
> > ++        break;
> > ++      i++;
> > ++    }
> > ++  }
> > ++  else
> > ++    return a || b;
> > ++  return match;
> > ++}
> > ++
> > + /* --- public functions --- */
> > +
> > + int curl_strequal(const char *first, const char *second)
> > +diff --git a/lib/strcase.h b/lib/strcase.h
> > +index 8929a53..8077108 100644
> > +--- a/lib/strcase.h
> > ++++ b/lib/strcase.h
> > +@@ -49,5 +49,6 @@ void Curl_strntoupper(char *dest, const char *src,
> size_t n);
> > + void Curl_strntolower(char *dest, const char *src, size_t n);
> > +
> > + bool Curl_safecmp(char *a, char *b);
> > ++int Curl_timestrcmp(const char *first, const char *second);
> > +
> > + #endif /* HEADER_CURL_STRCASE_H */
> > +diff --git a/lib/url.c b/lib/url.c
> > +index 9f14a7b..dfbde3b 100644
> > +--- a/lib/url.c
> > ++++ b/lib/url.c
> > +@@ -886,19 +886,10 @@ socks_proxy_info_matches(const struct proxy_info=
*
> data,
> > +   /* the user information is case-sensitive
> > +      or at least it is not defined as case-insensitive
> > +      see https://tools.ietf.org/html/rfc3986#section-3.2.1 */
> > +-  if((data->user =3D=3D NULL) !=3D (needle->user =3D=3D NULL))
> > +-    return FALSE;
> > +-  /* curl_strequal does a case insentive comparison, so do not use it
> here! */
> > +-  if(data->user &&
> > +-     needle->user &&
> > +-     strcmp(data->user, needle->user) !=3D 0)
> > +-    return FALSE;
> > +-  if((data->passwd =3D=3D NULL) !=3D (needle->passwd =3D=3D NULL))
> > +-    return FALSE;
> > ++
> > +   /* curl_strequal does a case insentive comparison, so do not use it
> here! */
> > +-  if(data->passwd &&
> > +-     needle->passwd &&
> > +-     strcmp(data->passwd, needle->passwd) !=3D 0)
> > ++  if(Curl_timestrcmp(data->user, needle->user) ||
> > ++     Curl_timestrcmp(data->passwd, needle->passwd))
> > +     return FALSE;
> > +   return TRUE;
> > + }
> > +@@ -1257,10 +1248,10 @@ ConnectionExists(struct Curl_easy *data,
> > +       if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
> > +         /* This protocol requires credentials per connection,
> > +            so verify that we're using the same name and password as
> well */
> > +-        if(strcmp(needle->user, check->user) ||
> > +-           strcmp(needle->passwd, check->passwd) ||
> > +-           !Curl_safecmp(needle->sasl_authzid, check->sasl_authzid) |=
|
> > +-           !Curl_safecmp(needle->oauth_bearer, check->oauth_bearer)) =
{
> > ++        if(Curl_timestrcmp(needle->user, check->user) ||
> > ++           Curl_timestrcmp(needle->passwd, check->passwd) ||
> > ++           Curl_timestrcmp(needle->sasl_authzid, check->sasl_authzid)
> ||
> > ++           Curl_timestrcmp(needle->oauth_bearer, check->oauth_bearer)=
)
> {
> > +           /* one of them was different */
> > +           continue;
> > +         }
> > +@@ -1326,8 +1317,8 @@ ConnectionExists(struct Curl_easy *data,
> > +            possible. (Especially we must not reuse the same connectio=
n
> if
> > +            partway through a handshake!) */
> > +         if(wantNTLMhttp) {
> > +-          if(strcmp(needle->user, check->user) ||
> > +-             strcmp(needle->passwd, check->passwd)) {
> > ++          if(Curl_timestrcmp(needle->user, check->user) ||
> > ++             Curl_timestrcmp(needle->passwd, check->passwd)) {
> > +
> > +             /* we prefer a credential match, but this is at least a
> connection
> > +                that can be reused and "upgraded" to NTLM */
> > +@@ -1348,8 +1339,10 @@ ConnectionExists(struct Curl_easy *data,
> > +           if(!check->http_proxy.user || !check->http_proxy.passwd)
> > +             continue;
> > +
> > +-          if(strcmp(needle->http_proxy.user, check->http_proxy.user) =
||
> > +-             strcmp(needle->http_proxy.passwd,
> check->http_proxy.passwd))
> > ++          if(Curl_timestrcmp(needle->http_proxy.user,
> > ++                             check->http_proxy.user) ||
> > ++             Curl_timestrcmp(needle->http_proxy.passwd,
> > ++                             check->http_proxy.passwd))
> > +             continue;
> > +         }
> > +         else if(check->proxy_ntlm_state !=3D NTLMSTATE_NONE) {
> > +diff --git a/lib/vauth/digest_sspi.c b/lib/vauth/digest_sspi.c
> > +index a109056..3986386 100644
> > +--- a/lib/vauth/digest_sspi.c
> > ++++ b/lib/vauth/digest_sspi.c
> > +@@ -450,8 +450,8 @@ CURLcode
> Curl_auth_create_digest_http_message(struct Curl_easy *data,
> > +      has changed then delete that context. */
> > +   if((userp && !digest->user) || (!userp && digest->user) ||
> > +      (passwdp && !digest->passwd) || (!passwdp && digest->passwd) ||
> > +-     (userp && digest->user && strcmp(userp, digest->user)) ||
> > +-     (passwdp && digest->passwd && strcmp(passwdp, digest->passwd))) =
{
> > ++     (userp && digest->user && Curl_timestrcmp(userp, digest->user)) =
||
> > ++     (passwdp && digest->passwd && Curl_timestrcmp(passwdp,
> digest->passwd))) {
> > +     if(digest->http_context) {
> > +       s_pSecFn->DeleteSecurityContext(digest->http_context);
> > +       Curl_safefree(digest->http_context);
> > +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> > +index e8cb70f..70a9391 100644
> > +--- a/lib/vtls/vtls.c
> > ++++ b/lib/vtls/vtls.c
> > +@@ -98,9 +98,15 @@ Curl_ssl_config_matches(struct ssl_primary_config*
> data,
> > +      Curl_safecmp(data->issuercert, needle->issuercert) &&
> > +      Curl_safecmp(data->clientcert, needle->clientcert) &&
> > +      Curl_safecmp(data->random_file, needle->random_file) &&
> > +-     Curl_safecmp(data->egdsocket, needle->egdsocket) &&
> > ++     Curl_safecmp(data->egdsocket, needle->egdsocket) &&
> > ++#ifdef USE_TLS_SRP
> > ++     !Curl_timestrcmp(data->username, needle->username) &&
> > ++     !Curl_timestrcmp(data->password, needle->password) &&
> > ++     (data->authtype =3D=3D needle->authtype) &&
> > ++#endif
> > +      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list)
> &&
> > +      Curl_safe_strcasecompare(data->cipher_list13,
> needle->cipher_list13) &&
> > ++     Curl_safe_strcasecompare(data->CRLfile, needle->CRLfile) &&
> > +      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
> > +     return TRUE;
> > +
> > +@@ -117,6 +123,9 @@ Curl_clone_primary_ssl_config(struct
> ssl_primary_config *source,
> > +   dest->verifyhost =3D source->verifyhost;
> > +   dest->verifystatus =3D source->verifystatus;
> > +   dest->sessionid =3D source->sessionid;
> > ++#ifdef USE_TLS_SRP
> > ++  dest->authtype =3D source->authtype;
> > ++#endif
> > +
> > +   CLONE_STRING(CApath);
> > +   CLONE_STRING(CAfile);
> > +@@ -127,6 +136,11 @@ Curl_clone_primary_ssl_config(struct
> ssl_primary_config *source,
> > +   CLONE_STRING(cipher_list);
> > +   CLONE_STRING(cipher_list13);
> > +   CLONE_STRING(pinned_key);
> > ++  CLONE_STRING(CRLfile);
> > ++#ifdef USE_TLS_SRP
> > ++  CLONE_STRING(username);
> > ++  CLONE_STRING(password);
> > ++#endif
> > +
> > +   return TRUE;
> > + }
> > +@@ -142,6 +156,11 @@ void Curl_free_primary_ssl_config(struct
> ssl_primary_config* sslc)
> > +   Curl_safefree(sslc->cipher_list);
> > +   Curl_safefree(sslc->cipher_list13);
> > +   Curl_safefree(sslc->pinned_key);
> > ++  Curl_safefree(sslc->CRLfile);
> > ++#ifdef USE_TLS_SRP
> > ++  Curl_safefree(sslc->username);
> > ++  Curl_safefree(sslc->password);
> > ++#endif
> > + }
> > +
> > + #ifdef USE_SSL
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535.patch
> b/meta/recipes-support/curl/curl/CVE-2023-27535.patch
> > new file mode 100644
> > index 0000000000..e38390a57c
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-27535.patch
> > @@ -0,0 +1,170 @@
> > +From 8f4608468b890dce2dad9f91d5607ee7e9c1aba1 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Thu, 9 Mar 2023 17:47:06 +0100
> > +Subject: [PATCH] ftp: add more conditions for connection reuse
> > +
> > +Reported-by: Harry Sintonen
> > +Closes #10730
> > +
> > +Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-202=
3-27535.patch?h=3Dubuntu/focal-security
> > +Upstream commit
> https://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1a=
ba1
> ]
> > +CVE: CVE-2023-27535
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/ftp.c     | 30 ++++++++++++++++++++++++++++--
> > + lib/ftp.h     |  5 +++++
> > + lib/setopt.c  |  2 +-
> > + lib/url.c     | 16 +++++++++++++++-
> > + lib/urldata.h |  4 ++--
> > + 5 files changed, 51 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/lib/ftp.c b/lib/ftp.c
> > +index 31a34e8..7a82a74 100644
> > +--- a/lib/ftp.c
> > ++++ b/lib/ftp.c
> > +@@ -4059,6 +4059,10 @@ static CURLcode ftp_disconnect(struct
> connectdata *conn, bool dead_connection)
> > +   }
> > +
> > +   freedirs(ftpc);
> > ++  free(ftpc->account);
> > ++  ftpc->account =3D NULL;
> > ++  free(ftpc->alternative_to_user);
> > ++  ftpc->alternative_to_user =3D NULL;
> > +   free(ftpc->prevpath);
> > +   ftpc->prevpath =3D NULL;
> > +   free(ftpc->server_os);
> > +@@ -4326,11 +4330,31 @@ static CURLcode ftp_setup_connection(struct
> connectdata *conn)
> > +   struct Curl_easy *data =3D conn->data;
> > +   char *type;
> > +   struct FTP *ftp;
> > ++  struct ftp_conn *ftpc =3D &conn->proto.ftpc;
> > +
> > +-  conn->data->req.protop =3D ftp =3D calloc(sizeof(struct FTP), 1);
> > ++  ftp =3D calloc(sizeof(struct FTP), 1);
> > +   if(NULL =3D=3D ftp)
> > +     return CURLE_OUT_OF_MEMORY;
> > +
> > ++  /* clone connection related data that is FTP specific */
> > ++  if(data->set.str[STRING_FTP_ACCOUNT]) {
> > ++    ftpc->account =3D strdup(data->set.str[STRING_FTP_ACCOUNT]);
> > ++    if(!ftpc->account) {
> > ++      free(ftp);
> > ++      return CURLE_OUT_OF_MEMORY;
> > ++    }
> > ++  }
> > ++  if(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]) {
> > ++    ftpc->alternative_to_user =3D
> > ++      strdup(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]);
> > ++    if(!ftpc->alternative_to_user) {
> > ++      Curl_safefree(ftpc->account);
> > ++      free(ftp);
> > ++      return CURLE_OUT_OF_MEMORY;
> > ++    }
> > ++  }
> > ++  conn->data->req.protop =3D ftp;
> > ++
> > +   ftp->path =3D &data->state.up.path[1]; /* don't include the initial
> slash */
> > +
> > +   /* FTP URLs support an extension like ";type=3D<typecode>" that
> > +@@ -4366,7 +4390,9 @@ static CURLcode ftp_setup_connection(struct
> connectdata *conn)
> > +   /* get some initial data into the ftp struct */
> > +   ftp->transfer =3D FTPTRANSFER_BODY;
> > +   ftp->downloadsize =3D 0;
> > +-  conn->proto.ftpc.known_filesize =3D -1; /* unknown size for now */
> > ++  ftpc->known_filesize =3D -1; /* unknown size for now */
> > ++  ftpc->use_ssl =3D data->set.use_ssl;
> > ++  ftpc->ccc =3D data->set.ftp_ccc;
> > +
> > +   return CURLE_OK;
> > + }
> > +diff --git a/lib/ftp.h b/lib/ftp.h
> > +index 984347f..163dcb3 100644
> > +--- a/lib/ftp.h
> > ++++ b/lib/ftp.h
> > +@@ -116,6 +116,8 @@ struct FTP {
> > +    struct */
> > + struct ftp_conn {
> > +   struct pingpong pp;
> > ++  char *account;
> > ++  char *alternative_to_user;
> > +   char *entrypath; /* the PWD reply when we logged on */
> > +   char **dirs;   /* realloc()ed array for path components */
> > +   int dirdepth;  /* number of entries used in the 'dirs' array */
> > +@@ -141,6 +143,9 @@ struct ftp_conn {
> > +   ftpstate state; /* always use ftp.c:state() to change state! */
> > +   ftpstate state_saved; /* transfer type saved to be reloaded after
> > +                            data connection is established */
> > ++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for
> FTP or
> > ++                              IMAP or POP3 or others! (type:
> curl_usessl)*/
> > ++  unsigned char ccc;       /* ccc level for this connection */
> > +   curl_off_t retr_size_saved; /* Size of retrieved file saved */
> > +   char *server_os;     /* The target server operating system. */
> > +   curl_off_t known_filesize; /* file size is different from -1, if
> wildcard
> > +diff --git a/lib/setopt.c b/lib/setopt.c
> > +index 4d96f6b..a91bb70 100644
> > +--- a/lib/setopt.c
> > ++++ b/lib/setopt.c
> > +@@ -2126,7 +2126,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data,
> CURLoption option, va_list param)
> > +     arg =3D va_arg(param, long);
> > +     if((arg < CURLUSESSL_NONE) || (arg >=3D CURLUSESSL_LAST))
> > +       return CURLE_BAD_FUNCTION_ARGUMENT;
> > +-    data->set.use_ssl =3D (curl_usessl)arg;
> > ++    data->set.use_ssl =3D (unsigned char)arg;
> > +     break;
> > +
> > +   case CURLOPT_SSL_OPTIONS:
> > +diff --git a/lib/url.c b/lib/url.c
> > +index dfbde3b..f84375c 100644
> > +--- a/lib/url.c
> > ++++ b/lib/url.c
> > +@@ -1257,10 +1257,24 @@ ConnectionExists(struct Curl_easy *data,
> > +         }
> > +       }
> > +
> > +-      if(get_protocol_family(needle->handler->protocol) &
> PROTO_FAMILY_SSH) {
> > ++#ifdef USE_SSH
> > ++      else if(get_protocol_family(needle->handler->protocol) &
> PROTO_FAMILY_SSH) {
> > +         if(!ssh_config_matches(needle, check))
> > +           continue;
> > +       }
> > ++#endif
> > ++#ifndef CURL_DISABLE_FTP
> > ++      else if(get_protocol_family(needle->handler->protocol) &
> PROTO_FAMILY_FTP) {
> > ++        /* Also match ACCOUNT, ALTERNATIVE-TO-USER, USE_SSL and CCC
> options */
> > ++        if(Curl_timestrcmp(needle->proto.ftpc.account,
> > ++                           check->proto.ftpc.account) ||
> > ++           Curl_timestrcmp(needle->proto.ftpc.alternative_to_user,
> > ++                           check->proto.ftpc.alternative_to_user) ||
> > ++           (needle->proto.ftpc.use_ssl !=3D check->proto.ftpc.use_ssl=
) ||
> > ++           (needle->proto.ftpc.ccc !=3D check->proto.ftpc.ccc))
> > ++          continue;
> > ++      }
> > ++#endif
> > +
> > +       if(!needle->bits.httpproxy ||
> (needle->handler->flags&PROTOPT_SSL) ||
> > +          needle->bits.tunnel_proxy) {
> > +diff --git a/lib/urldata.h b/lib/urldata.h
> > +index 168f874..51b793b 100644
> > +--- a/lib/urldata.h
> > ++++ b/lib/urldata.h
> > +@@ -1730,8 +1730,6 @@ struct UserDefined {
> > +   void *ssh_keyfunc_userp;         /* custom pointer to callback */
> > +   enum CURL_NETRC_OPTION
> > +        use_netrc;        /* defined in include/curl.h */
> > +-  curl_usessl use_ssl;   /* if AUTH TLS is to be attempted etc, for
> FTP or
> > +-                            IMAP or POP3 or others! */
> > +   long new_file_perms;    /* Permissions to use when creating remote
> files */
> > +   long new_directory_perms; /* Permissions to use when creating remot=
e
> dirs */
> > +   long ssh_auth_types;   /* allowed SSH auth types */
> > +@@ -1851,6 +1849,8 @@ struct UserDefined {
> > +   BIT(http09_allowed); /* allow HTTP/0.9 responses */
> > +   BIT(mail_rcpt_allowfails); /* allow RCPT TO command to fail for som=
e
> > +                                 recipients */
> > ++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for
> FTP or
> > ++                              IMAP or POP3 or others! (type:
> curl_usessl)*/
> > + };
> > +
> > + struct Names {
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch
> b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
> > new file mode 100644
> > index 0000000000..b04a77de25
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
> > @@ -0,0 +1,55 @@
> > +From cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Fri, 10 Mar 2023 09:22:43 +0100
> > +Subject: [PATCH] url: only reuse connections with same GSS delegation
> > +
> > +Reported-by: Harry Sintonen
> > +Closes #10731
> > +
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56=
ee5
> ]
> > +CVE: CVE-2023-27536
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/url.c     | 6 ++++++
> > + lib/urldata.h | 1 +
> > + 2 files changed, 7 insertions(+)
> > +
> > +diff --git a/lib/url.c b/lib/url.c
> > +index f84375c..87f4eb0 100644
> > +--- a/lib/url.c
> > ++++ b/lib/url.c
> > +@@ -1257,6 +1257,11 @@ ConnectionExists(struct Curl_easy *data,
> > +         }
> > +       }
> > +
> > ++      /* GSS delegation differences do not actually affect every
> connection
> > ++         and auth method, but this check takes precaution before
> efficiency */
> > ++      if(needle->gssapi_delegation !=3D check->gssapi_delegation)
> > ++      continue;
> > ++
> > + #ifdef USE_SSH
> > +       else if(get_protocol_family(needle->handler->protocol) &
> PROTO_FAMILY_SSH) {
> > +         if(!ssh_config_matches(needle, check))
> > +@@ -1708,6 +1713,7 @@ static struct connectdata *allocate_conn(struct
> Curl_easy *data)
> > +   conn->fclosesocket =3D data->set.fclosesocket;
> > +   conn->closesocket_client =3D data->set.closesocket_client;
> > +   conn->lastused =3D Curl_now(); /* used now */
> > ++  conn->gssapi_delegation =3D data->set.gssapi_delegation;
> > +
> > +   return conn;
> > +   error:
> > +diff --git a/lib/urldata.h b/lib/urldata.h
> > +index 51b793b..b8a611b 100644
> > +--- a/lib/urldata.h
> > ++++ b/lib/urldata.h
> > +@@ -1118,6 +1118,7 @@ struct connectdata {
> > +                               handle */
> > +   BIT(sock_accepted); /* TRUE if the SECONDARYSOCKET was created with
> > +                          accept() */
> > ++  long gssapi_delegation; /* inherited from set.gssapi_delegation */
> > + };
> > +
> > + /* The end of connectdata. */
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch
> b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
> > new file mode 100644
> > index 0000000000..5cd11ef88b
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
> > @@ -0,0 +1,29 @@
> > +Backport of:
> > +
> > +From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Fri, 10 Mar 2023 08:22:51 +0100
> > +Subject: [PATCH] url: fix the SSH connection reuse check
> > +
> > +Reported-by: Harry Sintonen
> > +Closes #10735
> > +
> > +Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-202=
3-27538.patch?h=3Dubuntu/focal-security
> > +Upstream commit
> https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a087=
2eb
> ]
> > +CVE: CVE-2023-27538
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/url.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +--- a/lib/url.c
> > ++++ b/lib/url.c
> > +@@ -1233,7 +1233,7 @@ ConnectionExists(struct Curl_easy *data,
> > +         }
> > +       }
> > +
> > +-      if(get_protocol_family(needle->handler->protocol) =3D=3D
> PROTO_FAMILY_SSH) {
> > ++      if(get_protocol_family(needle->handler->protocol) &
> PROTO_FAMILY_SSH) {
> > +         if(!ssh_config_matches(needle, check))
> > +           continue;
> > +       }
> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb
> b/meta/recipes-support/curl/curl_7.69.1.bb
> > index a7f4f5748f..2e3bcb2c6e 100644
> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > @@ -44,6 +44,11 @@ SRC_URI =3D "
> https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >             file://CVE-2022-43552.patch \
> >             file://CVE-2023-23916.patch \
> >             file://CVE-2023-27534.patch \
> > +           file://CVE-2023-27533.patch \
> > +           file://CVE-2023-27538.patch \
> > +           file://CVE-2023-27535-pre1.patch \
> > +           file://CVE-2023-27535.patch \
> > +           file://CVE-2023-27536.patch \
> >  "
> >
> >  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180412):
> https://lists.openembedded.org/g/openembedded-core/message/180412
> > Mute This Topic: https://lists.openembedded.org/mt/98510578/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b1cfeb05fa47ecb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Steve for letting me know</div><div><br></div>=
<div>I will submit the v2 patch.</div><div><br></div><div>Thanks &amp; Rega=
rds,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 26, 2023 at 9:29=E2=80=AFPM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vijay=
,<br>
<br>
We already have a patch for CVE-2023-27538:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfe=
ll&amp;id=3Db2740d1ff74b2c55011b5d4230c7b06b5109376d" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?h=3D=
dunfell&amp;id=3Db2740d1ff74b2c55011b5d4230c7b06b5109376d</a><br>
<br>
Could you submit a v2 taking this into consideration?<br>
<br>
Thanks for helping with CVEs!<br>
<br>
Steve<br>
<br>
On Tue, Apr 25, 2023 at 10:18=E2=80=AFPM Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport [<a href=3D"https://git.launchpad.net/ubuntu=
/+source/curl/tree/debian/patches?h=3Dubuntu/focal-security" rel=3D"norefer=
rer" target=3D"_blank">https://git.launchpad.net/ubuntu/+source/curl/tree/d=
ebian/patches?h=3Dubuntu/focal-security</a> &amp; <a href=3D"https://github=
.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/curl/curl/commit/538b1e79a6e7b=
0bb829ab4cecc828d32105d0684</a> &amp; <a href=3D"https://github.com/curl/cu=
rl/commit/ed5095ed94281989e103c72e032200b83be37878" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/curl/curl/commit/ed5095ed94281989e103c72e0=
32200b83be37878</a> &amp; <a href=3D"https://github.com/curl/curl/commit/f1=
8af4f874cecab82a9797e8c7541e0990c7a64c" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a=
64c</a> &amp; <a href=3D"https://github.com/curl/curl/commit/8f4608468b890d=
ce2dad9f91d5607ee7e9c1aba1" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1</a> &amp=
; <a href=3D"https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086=
e3ec15b7d56ee5" rel=3D"noreferrer" target=3D"_blank">https://github.com/cur=
l/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5</a> &amp; <a href=3D=
"https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872=
eb" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl/curl/commi=
t/af369db4d3833272b8ed443f7fcc2e757a0872eb</a>]<br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-27533.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 59 +++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-27535-pre1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 236 ++++++++++++++++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-27535.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 170 +++++++++++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-27536.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 55 ++++<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-27538.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 29 +++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 6 files changed, 554 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533=
.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535=
-pre1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535=
.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536=
.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-27533.patch b/met=
a/recipes-support/curl/curl/CVE-2023-27533.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..64ba135056<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-27533.patch<br>
&gt; @@ -0,0 +1,59 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From 538b1e79a6e7b0bb829ab4cecc828d32105d0684 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Mon, 6 Mar 2023 12:07:33 +0100<br>
&gt; +Subject: [PATCH] telnet: only accept option arguments in ascii<br>
&gt; +<br>
&gt; +To avoid embedded telnet negotiation commands etc.<br>
&gt; +<br>
&gt; +Reported-by: Harry Sintonen<br>
&gt; +Closes #10728<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.=
launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27533.patch?=
h=3Dubuntu/focal-security" rel=3D"noreferrer" target=3D"_blank">https://git=
.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27533.patch=
?h=3Dubuntu/focal-security</a><br>
&gt; +Upstream commit <a href=3D"https://github.com/curl/curl/commit/538b1e=
79a6e7b0bb829ab4cecc828d32105d0684" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684<=
/a>]<br>
&gt; +CVE: CVE-2023-27533<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/telnet.c | 15 +++++++++++++++<br>
&gt; + 1 file changed, 15 insertions(+)<br>
&gt; +<br>
&gt; +--- a/lib/telnet.c<br>
&gt; ++++ b/lib/telnet.c<br>
&gt; +@@ -815,6 +815,17 @@ static void printsub(struct Curl_easy *d<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static bool str_is_nonascii(const char *str)<br>
&gt; ++{<br>
&gt; ++=C2=A0 size_t len =3D strlen(str);<br>
&gt; ++=C2=A0 while(len--) {<br>
&gt; ++=C2=A0 =C2=A0 if(*str &amp; 0x80)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
&gt; ++=C2=A0 =C2=A0 str++;<br>
&gt; ++=C2=A0 }<br>
&gt; ++=C2=A0 return FALSE;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static CURLcode check_telnet_options(struct connectdata *conn)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0struct curl_slist *head;<br>
&gt; +@@ -829,6 +840,8 @@ static CURLcode check_telnet_options(str<br>
&gt; +=C2=A0 =C2=A0/* Add the user name as an environment variable if it<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 was given on the command line */<br>
&gt; +=C2=A0 =C2=A0if(conn-&gt;bits.user_passwd) {<br>
&gt; ++=C2=A0 =C2=A0 if(str_is_nonascii(data-&gt;conn-&gt;user))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return CURLE_BAD_FUNCTION_ARGUMENT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msnprintf(option_arg, sizeof(option_arg), &quot;U=
SER,%s&quot;, conn-&gt;user);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0beg =3D curl_slist_append(tn-&gt;telnet_vars, opt=
ion_arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(!beg) {<br>
&gt; +@@ -844,6 +857,9 @@ static CURLcode check_telnet_options(str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(sscanf(head-&gt;data, &quot;%127[^=3D ]%*[ =3D=
]%255s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0option_keyword=
, option_arg) =3D=3D 2) {<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(str_is_nonascii(option_arg))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Terminal type */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(strcasecompare(option_keyword, &quot;TT=
YPE&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(tn-&gt;subopt_ttype, option=
_arg, 31);<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch =
b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..034b72f7e6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch<br>
&gt; @@ -0,0 +1,236 @@<br>
&gt; +From ed5095ed94281989e103c72e032200b83be37878 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Thu, 6 Oct 2022 00:49:10 +0200<br>
&gt; +Subject: [PATCH] strcase: add and use Curl_timestrcmp<br>
&gt; +<br>
&gt; +This is a strcmp() alternative function for comparing &quot;secrets&q=
uot;,<br>
&gt; +designed to take the same time no matter the content to not leak<br>
&gt; +match/non-match info to observers based on how fast it is.<br>
&gt; +<br>
&gt; +The time this function takes is only a function of the shortest input=
<br>
&gt; +string.<br>
&gt; +<br>
&gt; +Reported-by: Trail of Bits<br>
&gt; +<br>
&gt; +Closes #9658<br>
&gt; +<br>
&gt; +Upstream-Status: Backport from [<a href=3D"https://github.com/curl/cu=
rl/commit/ed5095ed94281989e103c72e032200b83be37878" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/curl/curl/commit/ed5095ed94281989e103c72e0=
32200b83be37878</a> &amp; <a href=3D"https://github.com/curl/curl/commit/f1=
8af4f874cecab82a9797e8c7541e0990c7a64c" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a=
64c</a>]<br>
&gt; +Comment: to backport fix for CVE-2023-27535, add function Curl_timest=
rcmp.<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/netrc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6=
 +++---<br>
&gt; + lib/strcase.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++=
+++++++++++++<br>
&gt; + lib/strcase.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br=
>
&gt; + lib/url.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33=
 +++++++++++++--------------------<br>
&gt; + lib/vauth/digest_sspi.c |=C2=A0 4 ++--<br>
&gt; + lib/vtls/vtls.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++++++++++=
++++++-<br>
&gt; + 6 files changed, 61 insertions(+), 26 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/netrc.c b/lib/netrc.c<br>
&gt; +index 9323913..fe3fd1e 100644<br>
&gt; +--- a/lib/netrc.c<br>
&gt; ++++ b/lib/netrc.c<br>
&gt; +@@ -124,9 +124,9 @@ static int parsenetrc(const char *host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we are now parsing sub-ke=
ywords concerning &quot;our&quot; host */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(state_login) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(specific_login) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state_our_login =3D=
 strcasecompare(login, tok);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state_our_login =3D=
 !Curl_timestrcmp(login, tok);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if(!login || strcmp(l=
ogin, tok)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if(!login || Curl_tim=
estrcmp(login, tok)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(login_alloc=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(lo=
gin);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0login_a=
lloc =3D FALSE;<br>
&gt; +@@ -142,7 +142,7 @@ static int parsenetrc(const char *host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if(state_password) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if((state_our_login |=
| !specific_login)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (=
!password || strcmp(password, tok))) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (!=
password || Curl_timestrcmp(password, tok))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(password_al=
loc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(pa=
ssword);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passwor=
d_alloc =3D FALSE;<br>
&gt; +diff --git a/lib/strcase.c b/lib/strcase.c<br>
&gt; +index 70bf21c..ec776b3 100644<br>
&gt; +--- a/lib/strcase.c<br>
&gt; ++++ b/lib/strcase.c<br>
&gt; +@@ -261,6 +261,28 @@ bool Curl_safecmp(char *a, char *b)<br>
&gt; +=C2=A0 =C2=A0return !a &amp;&amp; !b;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/*<br>
&gt; ++ * Curl_timestrcmp() returns 0 if the two strings are identical. The=
 time this<br>
&gt; ++ * function spends is a function of the shortest string, not of the =
contents.<br>
&gt; ++ */<br>
&gt; ++int Curl_timestrcmp(const char *a, const char *b)<br>
&gt; ++{<br>
&gt; ++=C2=A0 int match =3D 0;<br>
&gt; ++=C2=A0 int i =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 if(a &amp;&amp; b) {<br>
&gt; ++=C2=A0 =C2=A0 while(1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 match |=3D a[i]^b[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(!a[i] || !b[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 }<br>
&gt; ++=C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 return a || b;<br>
&gt; ++=C2=A0 return match;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /* --- public functions --- */<br>
&gt; +<br>
&gt; + int curl_strequal(const char *first, const char *second)<br>
&gt; +diff --git a/lib/strcase.h b/lib/strcase.h<br>
&gt; +index 8929a53..8077108 100644<br>
&gt; +--- a/lib/strcase.h<br>
&gt; ++++ b/lib/strcase.h<br>
&gt; +@@ -49,5 +49,6 @@ void Curl_strntoupper(char *dest, const char *src, =
size_t n);<br>
&gt; + void Curl_strntolower(char *dest, const char *src, size_t n);<br>
&gt; +<br>
&gt; + bool Curl_safecmp(char *a, char *b);<br>
&gt; ++int Curl_timestrcmp(const char *first, const char *second);<br>
&gt; +<br>
&gt; + #endif /* HEADER_CURL_STRCASE_H */<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index 9f14a7b..dfbde3b 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -886,19 +886,10 @@ socks_proxy_info_matches(const struct proxy_inf=
o* data,<br>
&gt; +=C2=A0 =C2=A0/* the user information is case-sensitive<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 or at least it is not defined as case-insensitiv=
e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 see <a href=3D"https://tools.ietf.org/html/rfc39=
86#section-3.2.1" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.o=
rg/html/rfc3986#section-3.2.1</a> */<br>
&gt; +-=C2=A0 if((data-&gt;user =3D=3D NULL) !=3D (needle-&gt;user =3D=3D N=
ULL))<br>
&gt; +-=C2=A0 =C2=A0 return FALSE;<br>
&gt; +-=C2=A0 /* curl_strequal does a case insentive comparison, so do not =
use it here! */<br>
&gt; +-=C2=A0 if(data-&gt;user &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0needle-&gt;user &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0strcmp(data-&gt;user, needle-&gt;user) !=3D 0)<b=
r>
&gt; +-=C2=A0 =C2=A0 return FALSE;<br>
&gt; +-=C2=A0 if((data-&gt;passwd =3D=3D NULL) !=3D (needle-&gt;passwd =3D=
=3D NULL))<br>
&gt; +-=C2=A0 =C2=A0 return FALSE;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0/* curl_strequal does a case insentive comparison, so do=
 not use it here! */<br>
&gt; +-=C2=A0 if(data-&gt;passwd &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0needle-&gt;passwd &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0strcmp(data-&gt;passwd, needle-&gt;passwd) !=3D =
0)<br>
&gt; ++=C2=A0 if(Curl_timestrcmp(data-&gt;user, needle-&gt;user) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(data-&gt;passwd, needle-&gt;pass=
wd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt; +=C2=A0 =C2=A0return TRUE;<br>
&gt; + }<br>
&gt; +@@ -1257,10 +1248,10 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!(needle-&gt;handler-&gt;flags &amp; PR=
OTOPT_CREDSPERREQUEST)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This protocol requires credentia=
ls per connection,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 so verify that we&#39;re us=
ing the same name and password as well */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(strcmp(needle-&gt;user, check-&gt;use=
r) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(needle-&gt;passwd, c=
heck-&gt;passwd) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!Curl_safecmp(needle-&gt;sa=
sl_authzid, check-&gt;sasl_authzid) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!Curl_safecmp(needle-&gt;oa=
uth_bearer, check-&gt;oauth_bearer)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(Curl_timestrcmp(needle-&gt;user, chec=
k-&gt;user) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(needle-&gt;=
passwd, check-&gt;passwd) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(needle-&gt;=
sasl_authzid, check-&gt;sasl_authzid) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(needle-&gt;=
oauth_bearer, check-&gt;oauth_bearer)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* one of them was different=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -1326,8 +1317,8 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 possible. (Especially we mu=
st not reuse the same connection if<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partway through a handshake=
!) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(wantNTLMhttp) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(strcmp(needle-&gt;user, check-=
&gt;user) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(needle-&gt;pa=
sswd, check-&gt;passwd)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(Curl_timestrcmp(needle-&gt;use=
r, check-&gt;user) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(need=
le-&gt;passwd, check-&gt;passwd)) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we prefer a creden=
tial match, but this is at least a connection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that can be r=
eused and &quot;upgraded&quot; to NTLM */<br>
&gt; +@@ -1348,8 +1339,10 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!check-&gt;http_proxy.use=
r || !check-&gt;http_proxy.passwd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(strcmp(needle-&gt;http_proxy.u=
ser, check-&gt;http_proxy.user) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(needle-&gt;ht=
tp_proxy.passwd, check-&gt;http_proxy.passwd))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(Curl_timestrcmp(needle-&gt;htt=
p_proxy.user,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check-&gt;http_proxy.user) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(need=
le-&gt;http_proxy.passwd,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check-&gt;http_proxy.passwd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if(check-&gt;proxy_ntlm_state =
!=3D NTLMSTATE_NONE) {<br>
&gt; +diff --git a/lib/vauth/digest_sspi.c b/lib/vauth/digest_sspi.c<br>
&gt; +index a109056..3986386 100644<br>
&gt; +--- a/lib/vauth/digest_sspi.c<br>
&gt; ++++ b/lib/vauth/digest_sspi.c<br>
&gt; +@@ -450,8 +450,8 @@ CURLcode Curl_auth_create_digest_http_message(str=
uct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 has changed then delete that context. */<br>
&gt; +=C2=A0 =C2=A0if((userp &amp;&amp; !digest-&gt;user) || (!userp &amp;&=
amp; digest-&gt;user) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 (passwdp &amp;&amp; !digest-&gt;passwd) || (!pas=
swdp &amp;&amp; digest-&gt;passwd) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0(userp &amp;&amp; digest-&gt;user &amp;&amp; str=
cmp(userp, digest-&gt;user)) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0(passwdp &amp;&amp; digest-&gt;passwd &amp;&amp;=
 strcmp(passwdp, digest-&gt;passwd))) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0(userp &amp;&amp; digest-&gt;user &amp;&amp; Cur=
l_timestrcmp(userp, digest-&gt;user)) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0(passwdp &amp;&amp; digest-&gt;passwd &amp;&amp;=
 Curl_timestrcmp(passwdp, digest-&gt;passwd))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(digest-&gt;http_context) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s_pSecFn-&gt;DeleteSecurityContext(digest-=
&gt;http_context);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_safefree(digest-&gt;http_context);<br=
>
&gt; +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c<br>
&gt; +index e8cb70f..70a9391 100644<br>
&gt; +--- a/lib/vtls/vtls.c<br>
&gt; ++++ b/lib/vtls/vtls.c<br>
&gt; +@@ -98,9 +98,15 @@ Curl_ssl_config_matches(struct ssl_primary_config*=
 data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safecmp(data-&gt;issuercert, needle-&gt;iss=
uercert) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safecmp(data-&gt;clientcert, needle-&gt;cli=
entcert) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safecmp(data-&gt;random_file, needle-&gt;ra=
ndom_file) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0Curl_safecmp(data-&gt;egdsocket, needle-&gt;egds=
ocket) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0Curl_safecmp(data-&gt;egdsocket, needle-&gt;egds=
ocket) &amp;&amp;<br>
&gt; ++#ifdef USE_TLS_SRP<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0!Curl_timestrcmp(data-&gt;username, needle-&gt;u=
sername) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0!Curl_timestrcmp(data-&gt;password, needle-&gt;p=
assword) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0(data-&gt;authtype =3D=3D needle-&gt;authtype) &=
amp;&amp;<br>
&gt; ++#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safe_strcasecompare(data-&gt;cipher_list, n=
eedle-&gt;cipher_list) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safe_strcasecompare(data-&gt;cipher_list13,=
 needle-&gt;cipher_list13) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0Curl_safe_strcasecompare(data-&gt;CRLfile, needl=
e-&gt;CRLfile) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Curl_safe_strcasecompare(data-&gt;pinned_key, ne=
edle-&gt;pinned_key))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt; +<br>
&gt; +@@ -117,6 +123,9 @@ Curl_clone_primary_ssl_config(struct ssl_primary_=
config *source,<br>
&gt; +=C2=A0 =C2=A0dest-&gt;verifyhost =3D source-&gt;verifyhost;<br>
&gt; +=C2=A0 =C2=A0dest-&gt;verifystatus =3D source-&gt;verifystatus;<br>
&gt; +=C2=A0 =C2=A0dest-&gt;sessionid =3D source-&gt;sessionid;<br>
&gt; ++#ifdef USE_TLS_SRP<br>
&gt; ++=C2=A0 dest-&gt;authtype =3D source-&gt;authtype;<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0CLONE_STRING(CApath);<br>
&gt; +=C2=A0 =C2=A0CLONE_STRING(CAfile);<br>
&gt; +@@ -127,6 +136,11 @@ Curl_clone_primary_ssl_config(struct ssl_primary=
_config *source,<br>
&gt; +=C2=A0 =C2=A0CLONE_STRING(cipher_list);<br>
&gt; +=C2=A0 =C2=A0CLONE_STRING(cipher_list13);<br>
&gt; +=C2=A0 =C2=A0CLONE_STRING(pinned_key);<br>
&gt; ++=C2=A0 CLONE_STRING(CRLfile);<br>
&gt; ++#ifdef USE_TLS_SRP<br>
&gt; ++=C2=A0 CLONE_STRING(username);<br>
&gt; ++=C2=A0 CLONE_STRING(password);<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return TRUE;<br>
&gt; + }<br>
&gt; +@@ -142,6 +156,11 @@ void Curl_free_primary_ssl_config(struct ssl_pri=
mary_config* sslc)<br>
&gt; +=C2=A0 =C2=A0Curl_safefree(sslc-&gt;cipher_list);<br>
&gt; +=C2=A0 =C2=A0Curl_safefree(sslc-&gt;cipher_list13);<br>
&gt; +=C2=A0 =C2=A0Curl_safefree(sslc-&gt;pinned_key);<br>
&gt; ++=C2=A0 Curl_safefree(sslc-&gt;CRLfile);<br>
&gt; ++#ifdef USE_TLS_SRP<br>
&gt; ++=C2=A0 Curl_safefree(sslc-&gt;username);<br>
&gt; ++=C2=A0 Curl_safefree(sslc-&gt;password);<br>
&gt; ++#endif<br>
&gt; + }<br>
&gt; +<br>
&gt; + #ifdef USE_SSL<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535.patch b/met=
a/recipes-support/curl/curl/CVE-2023-27535.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e38390a57c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-27535.patch<br>
&gt; @@ -0,0 +1,170 @@<br>
&gt; +From 8f4608468b890dce2dad9f91d5607ee7e9c1aba1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Thu, 9 Mar 2023 17:47:06 +0100<br>
&gt; +Subject: [PATCH] ftp: add more conditions for connection reuse<br>
&gt; +<br>
&gt; +Reported-by: Harry Sintonen<br>
&gt; +Closes #10730<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.=
launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27535.patch?=
h=3Dubuntu/focal-security" rel=3D"noreferrer" target=3D"_blank">https://git=
.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27535.patch=
?h=3Dubuntu/focal-security</a><br>
&gt; +Upstream commit <a href=3D"https://github.com/curl/curl/commit/8f4608=
468b890dce2dad9f91d5607ee7e9c1aba1" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1<=
/a>]<br>
&gt; +CVE: CVE-2023-27535<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/ftp.c=C2=A0 =C2=A0 =C2=A0| 30 ++++++++++++++++++++++++++++--<br>
&gt; + lib/ftp.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt; + lib/setopt.c=C2=A0 |=C2=A0 2 +-<br>
&gt; + lib/url.c=C2=A0 =C2=A0 =C2=A0| 16 +++++++++++++++-<br>
&gt; + lib/urldata.h |=C2=A0 4 ++--<br>
&gt; + 5 files changed, 51 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/ftp.c b/lib/ftp.c<br>
&gt; +index 31a34e8..7a82a74 100644<br>
&gt; +--- a/lib/ftp.c<br>
&gt; ++++ b/lib/ftp.c<br>
&gt; +@@ -4059,6 +4059,10 @@ static CURLcode ftp_disconnect(struct connectd=
ata *conn, bool dead_connection)<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0freedirs(ftpc);<br>
&gt; ++=C2=A0 free(ftpc-&gt;account);<br>
&gt; ++=C2=A0 ftpc-&gt;account =3D NULL;<br>
&gt; ++=C2=A0 free(ftpc-&gt;alternative_to_user);<br>
&gt; ++=C2=A0 ftpc-&gt;alternative_to_user =3D NULL;<br>
&gt; +=C2=A0 =C2=A0free(ftpc-&gt;prevpath);<br>
&gt; +=C2=A0 =C2=A0ftpc-&gt;prevpath =3D NULL;<br>
&gt; +=C2=A0 =C2=A0free(ftpc-&gt;server_os);<br>
&gt; +@@ -4326,11 +4330,31 @@ static CURLcode ftp_setup_connection(struct c=
onnectdata *conn)<br>
&gt; +=C2=A0 =C2=A0struct Curl_easy *data =3D conn-&gt;data;<br>
&gt; +=C2=A0 =C2=A0char *type;<br>
&gt; +=C2=A0 =C2=A0struct FTP *ftp;<br>
&gt; ++=C2=A0 struct ftp_conn *ftpc =3D &amp;conn-&gt;proto.ftpc;<br>
&gt; +<br>
&gt; +-=C2=A0 conn-&gt;data-&gt;req.protop =3D ftp =3D calloc(sizeof(struct=
 FTP), 1);<br>
&gt; ++=C2=A0 ftp =3D calloc(sizeof(struct FTP), 1);<br>
&gt; +=C2=A0 =C2=A0if(NULL =3D=3D ftp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return CURLE_OUT_OF_MEMORY;<br>
&gt; +<br>
&gt; ++=C2=A0 /* clone connection related data that is FTP specific */<br>
&gt; ++=C2=A0 if(data-&gt;set.str[STRING_FTP_ACCOUNT]) {<br>
&gt; ++=C2=A0 =C2=A0 ftpc-&gt;account =3D strdup(data-&gt;set.str[STRING_FT=
P_ACCOUNT]);<br>
&gt; ++=C2=A0 =C2=A0 if(!ftpc-&gt;account) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 free(ftp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return CURLE_OUT_OF_MEMORY;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 }<br>
&gt; ++=C2=A0 if(data-&gt;set.str[STRING_FTP_ALTERNATIVE_TO_USER]) {<br>
&gt; ++=C2=A0 =C2=A0 ftpc-&gt;alternative_to_user =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 strdup(data-&gt;set.str[STRING_FTP_ALTERNATIVE_=
TO_USER]);<br>
&gt; ++=C2=A0 =C2=A0 if(!ftpc-&gt;alternative_to_user) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Curl_safefree(ftpc-&gt;account);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 free(ftp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return CURLE_OUT_OF_MEMORY;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 }<br>
&gt; ++=C2=A0 conn-&gt;data-&gt;req.protop =3D ftp;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0ftp-&gt;path =3D &amp;data-&gt;state.up.path[1]; /* don&=
#39;t include the initial slash */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* FTP URLs support an extension like &quot;;type=3D&lt;=
typecode&gt;&quot; that<br>
&gt; +@@ -4366,7 +4390,9 @@ static CURLcode ftp_setup_connection(struct con=
nectdata *conn)<br>
&gt; +=C2=A0 =C2=A0/* get some initial data into the ftp struct */<br>
&gt; +=C2=A0 =C2=A0ftp-&gt;transfer =3D FTPTRANSFER_BODY;<br>
&gt; +=C2=A0 =C2=A0ftp-&gt;downloadsize =3D 0;<br>
&gt; +-=C2=A0 conn-&gt;proto.ftpc.known_filesize =3D -1; /* unknown size fo=
r now */<br>
&gt; ++=C2=A0 ftpc-&gt;known_filesize =3D -1; /* unknown size for now */<br=
>
&gt; ++=C2=A0 ftpc-&gt;use_ssl =3D data-&gt;set.use_ssl;<br>
&gt; ++=C2=A0 ftpc-&gt;ccc =3D data-&gt;set.ftp_ccc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return CURLE_OK;<br>
&gt; + }<br>
&gt; +diff --git a/lib/ftp.h b/lib/ftp.h<br>
&gt; +index 984347f..163dcb3 100644<br>
&gt; +--- a/lib/ftp.h<br>
&gt; ++++ b/lib/ftp.h<br>
&gt; +@@ -116,6 +116,8 @@ struct FTP {<br>
&gt; +=C2=A0 =C2=A0 struct */<br>
&gt; + struct ftp_conn {<br>
&gt; +=C2=A0 =C2=A0struct pingpong pp;<br>
&gt; ++=C2=A0 char *account;<br>
&gt; ++=C2=A0 char *alternative_to_user;<br>
&gt; +=C2=A0 =C2=A0char *entrypath; /* the PWD reply when we logged on */<b=
r>
&gt; +=C2=A0 =C2=A0char **dirs;=C2=A0 =C2=A0/* realloc()ed array for path c=
omponents */<br>
&gt; +=C2=A0 =C2=A0int dirdepth;=C2=A0 /* number of entries used in the &#3=
9;dirs&#39; array */<br>
&gt; +@@ -141,6 +143,9 @@ struct ftp_conn {<br>
&gt; +=C2=A0 =C2=A0ftpstate state; /* always use ftp.c:state() to change st=
ate! */<br>
&gt; +=C2=A0 =C2=A0ftpstate state_saved; /* transfer type saved to be reloa=
ded after<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data connection is established */<br>
&gt; ++=C2=A0 unsigned char use_ssl;=C2=A0 =C2=A0/* if AUTH TLS is to be at=
tempted etc, for FTP or<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAP or POP3 or others! (type: curl_=
usessl)*/<br>
&gt; ++=C2=A0 unsigned char ccc;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ccc level for=
 this connection */<br>
&gt; +=C2=A0 =C2=A0curl_off_t retr_size_saved; /* Size of retrieved file sa=
ved */<br>
&gt; +=C2=A0 =C2=A0char *server_os;=C2=A0 =C2=A0 =C2=A0/* The target server=
 operating system. */<br>
&gt; +=C2=A0 =C2=A0curl_off_t known_filesize; /* file size is different fro=
m -1, if wildcard<br>
&gt; +diff --git a/lib/setopt.c b/lib/setopt.c<br>
&gt; +index 4d96f6b..a91bb70 100644<br>
&gt; +--- a/lib/setopt.c<br>
&gt; ++++ b/lib/setopt.c<br>
&gt; +@@ -2126,7 +2126,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, C=
URLoption option, va_list param)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0arg =3D va_arg(param, long);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if((arg &lt; CURLUSESSL_NONE) || (arg &gt;=3D CUR=
LUSESSL_LAST))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return CURLE_BAD_FUNCTION_ARGUMENT;<br>
&gt; +-=C2=A0 =C2=A0 data-&gt;set.use_ssl =3D (curl_usessl)arg;<br>
&gt; ++=C2=A0 =C2=A0 data-&gt;set.use_ssl =3D (unsigned char)arg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0case CURLOPT_SSL_OPTIONS:<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index dfbde3b..f84375c 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -1257,10 +1257,24 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if(get_protocol_family(needle-&gt;handler-&gt;p=
rotocol) &amp; PROTO_FAMILY_SSH) {<br>
&gt; ++#ifdef USE_SSH<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 else if(get_protocol_family(needle-&gt;handler-=
&gt;protocol) &amp; PROTO_FAMILY_SSH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!ssh_config_matches(needle, chec=
k))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++#endif<br>
&gt; ++#ifndef CURL_DISABLE_FTP<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 else if(get_protocol_family(needle-&gt;handler-=
&gt;protocol) &amp; PROTO_FAMILY_FTP) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Also match ACCOUNT, ALTERNATIVE-TO-US=
ER, USE_SSL and CCC options */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(Curl_timestrcmp(needle-&gt;proto.ftpc=
.account,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check-&gt;proto.ftpc.account) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(needle-&gt;=
proto.ftpc.alternative_to_user,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check-&gt;proto.ftpc.alternative_to_user) ||=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(needle-&gt;proto.ftpc.use_=
ssl !=3D check-&gt;proto.ftpc.use_ssl) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(needle-&gt;proto.ftpc.ccc =
!=3D check-&gt;proto.ftpc.ccc))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!needle-&gt;bits.httpproxy || (needle-&=
gt;handler-&gt;flags&amp;PROTOPT_SSL) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 needle-&gt;bits.tunnel_proxy) {<br=
>
&gt; +diff --git a/lib/urldata.h b/lib/urldata.h<br>
&gt; +index 168f874..51b793b 100644<br>
&gt; +--- a/lib/urldata.h<br>
&gt; ++++ b/lib/urldata.h<br>
&gt; +@@ -1730,8 +1730,6 @@ struct UserDefined {<br>
&gt; +=C2=A0 =C2=A0void *ssh_keyfunc_userp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* custom pointer to callback */<br>
&gt; +=C2=A0 =C2=A0enum CURL_NETRC_OPTION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 use_netrc;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
defined in include/curl.h */<br>
&gt; +-=C2=A0 curl_usessl use_ssl;=C2=A0 =C2=A0/* if AUTH TLS is to be atte=
mpted etc, for FTP or<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAP or POP3 or others! */<br>
&gt; +=C2=A0 =C2=A0long new_file_perms;=C2=A0 =C2=A0 /* Permissions to use =
when creating remote files */<br>
&gt; +=C2=A0 =C2=A0long new_directory_perms; /* Permissions to use when cre=
ating remote dirs */<br>
&gt; +=C2=A0 =C2=A0long ssh_auth_types;=C2=A0 =C2=A0/* allowed SSH auth typ=
es */<br>
&gt; +@@ -1851,6 +1849,8 @@ struct UserDefined {<br>
&gt; +=C2=A0 =C2=A0BIT(http09_allowed); /* allow HTTP/0.9 responses */<br>
&gt; +=C2=A0 =C2=A0BIT(mail_rcpt_allowfails); /* allow RCPT TO command to f=
ail for some<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipients */<br>
&gt; ++=C2=A0 unsigned char use_ssl;=C2=A0 =C2=A0/* if AUTH TLS is to be at=
tempted etc, for FTP or<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAP or POP3 or others! (type: curl_=
usessl)*/<br>
&gt; + };<br>
&gt; +<br>
&gt; + struct Names {<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/met=
a/recipes-support/curl/curl/CVE-2023-27536.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b04a77de25<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Fri, 10 Mar 2023 09:22:43 +0100<br>
&gt; +Subject: [PATCH] url: only reuse connections with same GSS delegation=
<br>
&gt; +<br>
&gt; +Reported-by: Harry Sintonen<br>
&gt; +Closes #10731<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec=
15b7d56ee5</a>]<br>
&gt; +CVE: CVE-2023-27536<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/url.c=C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt; + lib/urldata.h | 1 +<br>
&gt; + 2 files changed, 7 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index f84375c..87f4eb0 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -1257,6 +1257,11 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* GSS delegation differences do not actually a=
ffect every connection<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and auth method, but this check ta=
kes precaution before efficiency */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(needle-&gt;gssapi_delegation !=3D check-&gt;=
gssapi_delegation)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; + #ifdef USE_SSH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if(get_protocol_family(needle-&gt;han=
dler-&gt;protocol) &amp; PROTO_FAMILY_SSH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!ssh_config_matches(needle, chec=
k))<br>
&gt; +@@ -1708,6 +1713,7 @@ static struct connectdata *allocate_conn(struct=
 Curl_easy *data)<br>
&gt; +=C2=A0 =C2=A0conn-&gt;fclosesocket =3D data-&gt;set.fclosesocket;<br>
&gt; +=C2=A0 =C2=A0conn-&gt;closesocket_client =3D data-&gt;set.closesocket=
_client;<br>
&gt; +=C2=A0 =C2=A0conn-&gt;lastused =3D Curl_now(); /* used now */<br>
&gt; ++=C2=A0 conn-&gt;gssapi_delegation =3D data-&gt;set.gssapi_delegation=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return conn;<br>
&gt; +=C2=A0 =C2=A0error:<br>
&gt; +diff --git a/lib/urldata.h b/lib/urldata.h<br>
&gt; +index 51b793b..b8a611b 100644<br>
&gt; +--- a/lib/urldata.h<br>
&gt; ++++ b/lib/urldata.h<br>
&gt; +@@ -1118,6 +1118,7 @@ struct connectdata {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle */<br>
&gt; +=C2=A0 =C2=A0BIT(sock_accepted); /* TRUE if the SECONDARYSOCKET was c=
reated with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 accept() */<br>
&gt; ++=C2=A0 long gssapi_delegation; /* inherited from set.gssapi_delegati=
on */<br>
&gt; + };<br>
&gt; +<br>
&gt; + /* The end of connectdata. */<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/met=
a/recipes-support/curl/curl/CVE-2023-27538.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5cd11ef88b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Fri, 10 Mar 2023 08:22:51 +0100<br>
&gt; +Subject: [PATCH] url: fix the SSH connection reuse check<br>
&gt; +<br>
&gt; +Reported-by: Harry Sintonen<br>
&gt; +Closes #10735<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.=
launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27538.patch?=
h=3Dubuntu/focal-security" rel=3D"noreferrer" target=3D"_blank">https://git=
.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2023-27538.patch=
?h=3Dubuntu/focal-security</a><br>
&gt; +Upstream commit <a href=3D"https://github.com/curl/curl/commit/af369d=
b4d3833272b8ed443f7fcc2e757a0872eb" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb<=
/a>]<br>
&gt; +CVE: CVE-2023-27538<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/url.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -1233,7 +1233,7 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if(get_protocol_family(needle-&gt;handler-&gt;p=
rotocol) =3D=3D PROTO_FAMILY_SSH) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(get_protocol_family(needle-&gt;handler-&gt;p=
rotocol) &amp; PROTO_FAMILY_SSH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!ssh_config_matches(needle, chec=
k))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.b=
b" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.69.1.bb" rel=3D"noreferrer" target=3D"=
_blank">curl_7.69.1.bb</a><br>
&gt; index a7f4f5748f..2e3bcb2c6e 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt; @@ -44,6 +44,11 @@ SRC_URI =3D &quot;<a href=3D"https://curl.haxx.se/d=
ownload/curl-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https:=
//curl.haxx.se/download/curl-${PV}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-43552.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23916.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27534.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27533.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27538.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27535-pre1.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27535.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-27536.patch =
\<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;ec5fc263f898a3dfef08e805f1ecca42&quot;=
<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180412): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180412" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180412</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98510578=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98510578/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000b1cfeb05fa47ecb2--

