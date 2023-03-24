Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822C3C77B61
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 14:54:27 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.103268.1679669659450715678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 07:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TbxmeU0x;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id i6so2467415ybu.8
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679669658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1bbPRiTLmkhqZnKs5fbDppeRdvCl+A4BbFVs0tjH8Q=;
        b=TbxmeU0xyLs/CpBXHSnbYapHn4M3d+t20YGbHG2Uk9SyCjxq5pbCw0zPW6JffMmoM5
         0yzRgv47q/CWbK4qV3M1Ml4xOe1/QVM1den9fhTDR7lMIVQkEPXy9a06X/xFG5/p0inU
         lvolK/C6uhIiLoBN9eLwisbAn3+AWFqoFp3wkj8vhR2bAZyAeY00xT+31AgT+syJ9/XZ
         d2Pb9/dcHGqoj9ctu6MmB1wVIVA4DhhBJndmVzyLUsc1nTrjcxkjBBlYr4OFoKeZRRt+
         j677iFEAEFQu61QTjvXk+GIP0X/gRBMk3jk8KWQht/9C6U78kO9k8Zihsx0eKu3GQs5v
         v5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679669658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1bbPRiTLmkhqZnKs5fbDppeRdvCl+A4BbFVs0tjH8Q=;
        b=vz5UcPNWzuMuuBlYBbwx2n99cfTq3lVH9RN/wJSVI9JXtbLUltuksr4u9keckX7s8D
         16wNAZuQHSDUWSfx0d8FvOozAXO+9OQy5DdQB7/UUTR0z8unw2YzblMI6ktopI08rPua
         oSFNg06/0S+Bhnj2cpDl3Ai6T4LUzPZ/7M9vhJ1l8xb1s7ucTeLAGt7HA5axK46e9Xdo
         mEwEUcrRv/8AVJUy8hg5D7TFCKTAgLzBGCmOU5qqBqe3ASgw8SkcIu+NJEMuez0orJcs
         EcA3UYKbED/u4rH2BXj97nQyrGqFd5A1iEFohLzU0DR9tDs1i7Rd8dWKlGVJdHwYBupd
         cCog==
X-Gm-Message-State: AAQBX9faZlwcv/4Q/puh0CIcwtSZuIbqLMBkUQhKH6KTskZFp1EuZBjL
	yjN0aVit4lEyoiYlujweCra4FSzb8g/BVdvyyG0=
X-Google-Smtp-Source: AKy350aZN9HWUks2eADUvZNX0PNH4bGnT7ELRtZ2IoK40C/FVGldb4QZ6CBsP6BNxyKS8t0sh9FGBbBG7LHegXOByDU=
X-Received: by 2002:a25:b90a:0:b0:b77:81f:42da with SMTP id
 x10-20020a25b90a000000b00b77081f42damr1431343ybj.11.1679669658246; Fri, 24
 Mar 2023 07:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100059.59319-1-sdoshi@mvista.com>
In-Reply-To: <20230324100059.59319-1-sdoshi@mvista.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 24 Mar 2023 07:54:07 -0700
Message-ID: <CANx9H-CVKpnSASdzXm2BcK6xZnzAtMDdDEFUDxxBqxyLu1rjvQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] OpenSSL: Security fix for CVE-2023-0464
To: Siddharth <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051e47905f7a6915b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 14:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179039

--00000000000051e47905f7a6915b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 3:01=E2=80=AFAM Siddharth <sdoshi@mvista.com> wrote=
:

> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Upstream-Status: Backport from [
> https://git.openssl.org/gitweb/?p=3Dopenssl.git;a=3Dcommitdiff;h=3D959c59=
c7a0164117e7f8366466a32bb1f8d77ff1
> ]
>

Rather than backport, we should instead upgrade to 3.0.9
https://www.cve.org/CVERecord?id=3DCVE-2023-0464


> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../openssl/openssl/CVE-2023-0464.patch       | 226 ++++++++++++++++++
>  .../openssl/openssl_3.0.8.bb                  |   1 +
>  2 files changed, 227 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patc=
h
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
> new file mode 100644
> index 0000000000..69c7e2af67
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
> @@ -0,0 +1,226 @@
> +From 959c59c7a0164117e7f8366466a32bb1f8d77ff1 Mon Sep 17 00:00:00 2001
> +From: Pauli <pauli@openssl.org>
> +Date: Wed, 8 Mar 2023 15:28:20 +1100
> +Subject: [PATCH] x509: excessive resource use verifying policy constrain=
ts
> +
> +A security vulnerability has been identified in all supported versions
> +of OpenSSL related to the verification of X.509 certificate chains
> +that include policy constraints.  Attackers may be able to exploit this
> +vulnerability by creating a malicious certificate chain that triggers
> +exponential use of computational resources, leading to a denial-of-servi=
ce
> +(DoS) attack on affected systems.
> +
> +Fixes CVE-2023-0464
> +
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
> +(Merged from https://github.com/openssl/openssl/pull/20568)
> +
> +Upstream-Status: Backport from
> +[
> https://git.openssl.org/gitweb/?p=3Dopenssl.git;a=3Dcommitdiff;h=3D959c59=
c7a0164117e7f8366466a32bb1f8d77ff1
> ]
> +CVE: CVE-2023-0464
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + crypto/x509/pcy_local.h |  8 +++++++-
> + crypto/x509/pcy_node.c  | 12 +++++++++---
> + crypto/x509/pcy_tree.c  | 36 ++++++++++++++++++++++++++----------
> + 3 files changed, 42 insertions(+), 14 deletions(-)
> +
> +diff --git a/crypto/x509/pcy_local.h b/crypto/x509/pcy_local.h
> +index 18b53cc..cba107c 100644
> +--- a/crypto/x509/pcy_local.h
> ++++ b/crypto/x509/pcy_local.h
> +@@ -111,6 +111,11 @@ struct X509_POLICY_LEVEL_st {
> + };
> +
> + struct X509_POLICY_TREE_st {
> ++    /* The number of nodes in the tree */
> ++    size_t node_count;
> ++    /* The maximum number of nodes in the tree */
> ++    size_t node_maximum;
> ++
> +     /* This is the tree 'level' data */
> +     X509_POLICY_LEVEL *levels;
> +     int nlevel;
> +@@ -157,7 +162,8 @@ X509_POLICY_NODE
> *ossl_policy_tree_find_sk(STACK_OF(X509_POLICY_NODE) *sk,
> + X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
> +                                              X509_POLICY_DATA *data,
> +                                              X509_POLICY_NODE *parent,
> +-                                             X509_POLICY_TREE *tree);
> ++                                             X509_POLICY_TREE *tree,
> ++                                             int extra_data);
> + void ossl_policy_node_free(X509_POLICY_NODE *node);
> + int ossl_policy_node_match(const X509_POLICY_LEVEL *lvl,
> +                            const X509_POLICY_NODE *node, const
> ASN1_OBJECT *oid);
> +diff --git a/crypto/x509/pcy_node.c b/crypto/x509/pcy_node.c
> +index 9d9a7ea..450f95a 100644
> +--- a/crypto/x509/pcy_node.c
> ++++ b/crypto/x509/pcy_node.c
> +@@ -59,10 +59,15 @@ X509_POLICY_NODE *ossl_policy_level_find_node(const
> X509_POLICY_LEVEL *level,
> + X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
> +                                              X509_POLICY_DATA *data,
> +                                              X509_POLICY_NODE *parent,
> +-                                             X509_POLICY_TREE *tree)
> ++                                             X509_POLICY_TREE *tree,
> ++                                             int extra_data)
> + {
> +     X509_POLICY_NODE *node;
> +
> ++    /* Verify that the tree isn't too large.  This mitigates
> CVE-2023-0464 */
> ++    if (tree->node_maximum > 0 && tree->node_count >=3D tree->node_maxi=
mum)
> ++        return NULL;
> ++
> +     node =3D OPENSSL_zalloc(sizeof(*node));
> +     if (node =3D=3D NULL) {
> +         ERR_raise(ERR_LIB_X509V3, ERR_R_MALLOC_FAILURE);
> +@@ -70,7 +75,7 @@ X509_POLICY_NODE
> *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
> +     }
> +     node->data =3D data;
> +     node->parent =3D parent;
> +-    if (level) {
> ++    if (level !=3D NULL) {
> +         if (OBJ_obj2nid(data->valid_policy) =3D=3D NID_any_policy) {
> +             if (level->anyPolicy)
> +                 goto node_error;
> +@@ -90,7 +95,7 @@ X509_POLICY_NODE
> *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
> +         }
> +     }
> +
> +-    if (tree) {
> ++    if (extra_data) {
> +         if (tree->extra_data =3D=3D NULL)
> +             tree->extra_data =3D sk_X509_POLICY_DATA_new_null();
> +         if (tree->extra_data =3D=3D NULL){
> +@@ -103,6 +108,7 @@ X509_POLICY_NODE
> *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
> +         }
> +     }
> +
> ++    tree->node_count++;
> +     if (parent)
> +         parent->nchild++;
> +
> +diff --git a/crypto/x509/pcy_tree.c b/crypto/x509/pcy_tree.c
> +index fa45da5..f953a05 100644
> +--- a/crypto/x509/pcy_tree.c
> ++++ b/crypto/x509/pcy_tree.c
> +@@ -14,6 +14,17 @@
> +
> + #include "pcy_local.h"
> +
> ++/*
> ++ * If the maximum number of nodes in the policy tree isn't defined, set
> it to
> ++ * a generous default of 1000 nodes.
> ++ *
> ++ * Defining this to be zero means unlimited policy tree growth which
> opens the
> ++ * door on CVE-2023-0464.
> ++ */
> ++#ifndef OPENSSL_POLICY_TREE_NODES_MAX
> ++# define OPENSSL_POLICY_TREE_NODES_MAX 1000
> ++#endif
> ++
> + static void expected_print(BIO *channel,
> +                            X509_POLICY_LEVEL *lev, X509_POLICY_NODE
> *node,
> +                            int indent)
> +@@ -163,6 +174,9 @@ static int tree_init(X509_POLICY_TREE **ptree,
> STACK_OF(X509) *certs,
> +         return X509_PCY_TREE_INTERNAL;
> +     }
> +
> ++    /* Limit the growth of the tree to mitigate CVE-2023-0464 */
> ++    tree->node_maximum =3D OPENSSL_POLICY_TREE_NODES_MAX;
> ++
> +     /*
> +      * http://tools.ietf.org/html/rfc5280#section-6.1.2, figure 3.
> +      *
> +@@ -180,7 +194,7 @@ static int tree_init(X509_POLICY_TREE **ptree,
> STACK_OF(X509) *certs,
> +     if ((data =3D ossl_policy_data_new(NULL,
> +                                      OBJ_nid2obj(NID_any_policy), 0)) =
=3D=3D
> NULL)
> +         goto bad_tree;
> +-    if (ossl_policy_level_add_node(level, data, NULL, tree) =3D=3D NULL=
) {
> ++    if (ossl_policy_level_add_node(level, data, NULL, tree, 1) =3D=3D N=
ULL) {
> +         ossl_policy_data_free(data);
> +         goto bad_tree;
> +     }
> +@@ -239,7 +253,8 @@ static int tree_init(X509_POLICY_TREE **ptree,
> STACK_OF(X509) *certs,
> +  * Return value: 1 on success, 0 otherwise
> +  */
> + static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
> +-                                    X509_POLICY_DATA *data)
> ++                                    X509_POLICY_DATA *data,
> ++                                    X509_POLICY_TREE *tree)
> + {
> +     X509_POLICY_LEVEL *last =3D curr - 1;
> +     int i, matched =3D 0;
> +@@ -249,13 +264,13 @@ static int
> tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
> +         X509_POLICY_NODE *node =3D sk_X509_POLICY_NODE_value(last->node=
s,
> i);
> +
> +         if (ossl_policy_node_match(last, node, data->valid_policy)) {
> +-            if (ossl_policy_level_add_node(curr, data, node, NULL) =3D=
=3D
> NULL)
> ++            if (ossl_policy_level_add_node(curr, data, node, tree, 0) =
=3D=3D
> NULL)
> +                 return 0;
> +             matched =3D 1;
> +         }
> +     }
> +     if (!matched && last->anyPolicy) {
> +-        if (ossl_policy_level_add_node(curr, data, last->anyPolicy,
> NULL) =3D=3D NULL)
> ++        if (ossl_policy_level_add_node(curr, data, last->anyPolicy,
> tree, 0) =3D=3D NULL)
> +             return 0;
> +     }
> +     return 1;
> +@@ -268,7 +283,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVE=
L
> *curr,
> +  * Return value: 1 on success, 0 otherwise.
> +  */
> + static int tree_link_nodes(X509_POLICY_LEVEL *curr,
> +-                           const X509_POLICY_CACHE *cache)
> ++                           const X509_POLICY_CACHE *cache,
> ++                           X509_POLICY_TREE *tree)
> + {
> +     int i;
> +
> +@@ -276,7 +292,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
> +         X509_POLICY_DATA *data =3D sk_X509_POLICY_DATA_value(cache->dat=
a,
> i);
> +
> +         /* Look for matching nodes in previous level */
> +-        if (!tree_link_matching_nodes(curr, data))
> ++        if (!tree_link_matching_nodes(curr, data, tree))
> +             return 0;
> +     }
> +     return 1;
> +@@ -307,7 +323,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *cur=
r,
> +     /* Curr may not have anyPolicy */
> +     data->qualifier_set =3D cache->anyPolicy->qualifier_set;
> +     data->flags |=3D POLICY_DATA_FLAG_SHARED_QUALIFIERS;
> +-    if (ossl_policy_level_add_node(curr, data, node, tree) =3D=3D NULL)=
 {
> ++    if (ossl_policy_level_add_node(curr, data, node, tree, 1) =3D=3D NU=
LL) {
> +         ossl_policy_data_free(data);
> +         return 0;
> +     }
> +@@ -370,7 +386,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,
> +     /* Finally add link to anyPolicy */
> +     if (last->anyPolicy &&
> +             ossl_policy_level_add_node(curr, cache->anyPolicy,
> +-                                       last->anyPolicy, NULL) =3D=3D NU=
LL)
> ++                                       last->anyPolicy, tree, 0) =3D=3D=
 NULL)
> +         return 0;
> +     return 1;
> + }
> +@@ -553,7 +569,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE
> *tree,
> +             extra->flags =3D POLICY_DATA_FLAG_SHARED_QUALIFIERS
> +                 | POLICY_DATA_FLAG_EXTRA_NODE;
> +             node =3D ossl_policy_level_add_node(NULL, extra,
> anyPolicy->parent,
> +-                                              tree);
> ++                                              tree, 1);
> +         }
> +         if (!tree->user_policies) {
> +             tree->user_policies =3D sk_X509_POLICY_NODE_new_null();
> +@@ -580,7 +596,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)
> +
> +     for (i =3D 1; i < tree->nlevel; i++, curr++) {
> +         cache =3D ossl_policy_cache_set(curr->cert);
> +-        if (!tree_link_nodes(curr, cache))
> ++        if (!tree_link_nodes(curr, cache, tree))
> +             return X509_PCY_TREE_INTERNAL;
> +
> +         if (!(curr->flags & X509_V_FLAG_INHIBIT_ANY)
> +--
> +2.35.7
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> index 75f9e44748..92e460b1ba 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
>
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> +           file://CVE-2023-0464.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179027):
> https://lists.openembedded.org/g/openembedded-core/message/179027
> Mute This Topic: https://lists.openembedded.org/mt/97820339/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000051e47905f7a6915b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 24, 2023 at 3:01=E2=80=AF=
AM Siddharth &lt;<a href=3D"mailto:sdoshi@mvista.com">sdoshi@mvista.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" target=3D"_blank=
">sdoshi@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from [<a href=3D"https://git.openssl.org/gitweb/?=
p=3Dopenssl.git;a=3Dcommitdiff;h=3D959c59c7a0164117e7f8366466a32bb1f8d77ff1=
" rel=3D"noreferrer" target=3D"_blank">https://git.openssl.org/gitweb/?p=3D=
openssl.git;a=3Dcommitdiff;h=3D959c59c7a0164117e7f8366466a32bb1f8d77ff1</a>=
]<br></blockquote><div><br></div><div>Rather than backport, we should inste=
ad upgrade to 3.0.9</div><div><a href=3D"https://www.cve.org/CVERecord?id=
=3DCVE-2023-0464">https://www.cve.org/CVERecord?id=3DCVE-2023-0464</a></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/CVE-2023-0464.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
26 ++++++++++++++++++<br>
=C2=A0.../openssl/<a href=3D"http://openssl_3.0.8.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssl_3.0.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 227 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023=
-0464.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch =
b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch<br>
new file mode 100644<br>
index 0000000000..69c7e2af67<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch<br>
@@ -0,0 +1,226 @@<br>
+From 959c59c7a0164117e7f8366466a32bb1f8d77ff1 Mon Sep 17 00:00:00 2001<br>
+From: Pauli &lt;<a href=3D"mailto:pauli@openssl.org" target=3D"_blank">pau=
li@openssl.org</a>&gt;<br>
+Date: Wed, 8 Mar 2023 15:28:20 +1100<br>
+Subject: [PATCH] x509: excessive resource use verifying policy constraints=
<br>
+<br>
+A security vulnerability has been identified in all supported versions<br>
+of OpenSSL related to the verification of X.509 certificate chains<br>
+that include policy constraints.=C2=A0 Attackers may be able to exploit th=
is<br>
+vulnerability by creating a malicious certificate chain that triggers<br>
+exponential use of computational resources, leading to a denial-of-service=
<br>
+(DoS) attack on affected systems.<br>
+<br>
+Fixes CVE-2023-0464<br>
+<br>
+Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@openssl.org" target=3D=
"_blank">tomas@openssl.org</a>&gt;<br>
+Reviewed-by: Shane Lontis &lt;<a href=3D"mailto:shane.lontis@oracle.com" t=
arget=3D"_blank">shane.lontis@oracle.com</a>&gt;<br>
+(Merged from <a href=3D"https://github.com/openssl/openssl/pull/20568" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/pull/2=
0568</a>)<br>
+<br>
+Upstream-Status: Backport from<br>
+[<a href=3D"https://git.openssl.org/gitweb/?p=3Dopenssl.git;a=3Dcommitdiff=
;h=3D959c59c7a0164117e7f8366466a32bb1f8d77ff1" rel=3D"noreferrer" target=3D=
"_blank">https://git.openssl.org/gitweb/?p=3Dopenssl.git;a=3Dcommitdiff;h=
=3D959c59c7a0164117e7f8366466a32bb1f8d77ff1</a>]<br>
+CVE: CVE-2023-0464<br>
+Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" ta=
rget=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
+---<br>
+ crypto/x509/pcy_local.h |=C2=A0 8 +++++++-<br>
+ crypto/x509/pcy_node.c=C2=A0 | 12 +++++++++---<br>
+ crypto/x509/pcy_tree.c=C2=A0 | 36 ++++++++++++++++++++++++++----------<br=
>
+ 3 files changed, 42 insertions(+), 14 deletions(-)<br>
+<br>
+diff --git a/crypto/x509/pcy_local.h b/crypto/x509/pcy_local.h<br>
+index 18b53cc..cba107c 100644<br>
+--- a/crypto/x509/pcy_local.h<br>
++++ b/crypto/x509/pcy_local.h<br>
+@@ -111,6 +111,11 @@ struct X509_POLICY_LEVEL_st {<br>
+ };<br>
+ <br>
+ struct X509_POLICY_TREE_st {<br>
++=C2=A0 =C2=A0 /* The number of nodes in the tree */<br>
++=C2=A0 =C2=A0 size_t node_count;<br>
++=C2=A0 =C2=A0 /* The maximum number of nodes in the tree */<br>
++=C2=A0 =C2=A0 size_t node_maximum;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0/* This is the tree &#39;level&#39; data */<br>
+=C2=A0 =C2=A0 =C2=A0X509_POLICY_LEVEL *levels;<br>
+=C2=A0 =C2=A0 =C2=A0int nlevel;<br>
+@@ -157,7 +162,8 @@ X509_POLICY_NODE *ossl_policy_tree_find_sk(STACK_OF(X5=
09_POLICY_NODE) *sk,<br>
+ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 X509_POLICY_DATA *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 X509_POLICY_NODE *parent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X509_POLICY_TREE *tree);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X509_POLICY_TREE *tree,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int extra_data);<br>
+ void ossl_policy_node_free(X509_POLICY_NODE *node);<br>
+ int ossl_policy_node_match(const X509_POLICY_LEVEL *lvl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const X509_POLICY_NODE *node, const ASN1_OBJECT *o=
id);<br>
+diff --git a/crypto/x509/pcy_node.c b/crypto/x509/pcy_node.c<br>
+index 9d9a7ea..450f95a 100644<br>
+--- a/crypto/x509/pcy_node.c<br>
++++ b/crypto/x509/pcy_node.c<br>
+@@ -59,10 +59,15 @@ X509_POLICY_NODE *ossl_policy_level_find_node(const X5=
09_POLICY_LEVEL *level,<br>
+ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 X509_POLICY_DATA *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 X509_POLICY_NODE *parent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X509_POLICY_TREE *tree)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X509_POLICY_TREE *tree,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int extra_data)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0X509_POLICY_NODE *node;<br>
+ <br>
++=C2=A0 =C2=A0 /* Verify that the tree isn&#39;t too large.=C2=A0 This mit=
igates CVE-2023-0464 */<br>
++=C2=A0 =C2=A0 if (tree-&gt;node_maximum &gt; 0 &amp;&amp; tree-&gt;node_c=
ount &gt;=3D tree-&gt;node_maximum)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0node =3D OPENSSL_zalloc(sizeof(*node));<br>
+=C2=A0 =C2=A0 =C2=A0if (node =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERR_raise(ERR_LIB_X509V3, ERR_R_MALLOC_F=
AILURE);<br>
+@@ -70,7 +75,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY=
_LEVEL *level,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0node-&gt;data =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0node-&gt;parent =3D parent;<br>
+-=C2=A0 =C2=A0 if (level) {<br>
++=C2=A0 =C2=A0 if (level !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (OBJ_obj2nid(data-&gt;valid_policy) =
=3D=3D NID_any_policy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (level-&gt;anyPolicy)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto node_er=
ror;<br>
+@@ -90,7 +95,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY=
_LEVEL *level,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 if (tree) {<br>
++=C2=A0 =C2=A0 if (extra_data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tree-&gt;extra_data =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tree-&gt;extra_data =3D sk=
_X509_POLICY_DATA_new_null();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tree-&gt;extra_data =3D=3D NULL){<br=
>
+@@ -103,6 +108,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLI=
CY_LEVEL *level,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 tree-&gt;node_count++;<br>
+=C2=A0 =C2=A0 =C2=A0if (parent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;nchild++;<br>
+ <br>
+diff --git a/crypto/x509/pcy_tree.c b/crypto/x509/pcy_tree.c<br>
+index fa45da5..f953a05 100644<br>
+--- a/crypto/x509/pcy_tree.c<br>
++++ b/crypto/x509/pcy_tree.c<br>
+@@ -14,6 +14,17 @@<br>
+ <br>
+ #include &quot;pcy_local.h&quot;<br>
+ <br>
++/*<br>
++ * If the maximum number of nodes in the policy tree isn&#39;t defined, s=
et it to<br>
++ * a generous default of 1000 nodes.<br>
++ *<br>
++ * Defining this to be zero means unlimited policy tree growth which open=
s the<br>
++ * door on CVE-2023-0464.<br>
++ */<br>
++#ifndef OPENSSL_POLICY_TREE_NODES_MAX<br>
++# define OPENSSL_POLICY_TREE_NODES_MAX 1000<br>
++#endif<br>
++<br>
+ static void expected_print(BIO *channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 X509_POLICY_LEVEL *lev, X509_POLICY_NODE *node,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int indent)<br>
+@@ -163,6 +174,9 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_O=
F(X509) *certs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return X509_PCY_TREE_INTERNAL;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 /* Limit the growth of the tree to mitigate CVE-2023-0464 *=
/<br>
++=C2=A0 =C2=A0 tree-&gt;node_maximum =3D OPENSSL_POLICY_TREE_NODES_MAX;<br=
>
++<br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 * <a href=3D"http://tools.ietf.org/html/rfc5280#secti=
on-6.1.2" rel=3D"noreferrer" target=3D"_blank">http://tools.ietf.org/html/r=
fc5280#section-6.1.2</a>, figure 3.<br>
+=C2=A0 =C2=A0 =C2=A0 *<br>
+@@ -180,7 +194,7 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_O=
F(X509) *certs,<br>
+=C2=A0 =C2=A0 =C2=A0if ((data =3D ossl_policy_data_new(NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJ_nid2obj(NID=
_any_policy), 0)) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_tree;<br>
+-=C2=A0 =C2=A0 if (ossl_policy_level_add_node(level, data, NULL, tree) =3D=
=3D NULL) {<br>
++=C2=A0 =C2=A0 if (ossl_policy_level_add_node(level, data, NULL, tree, 1) =
=3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ossl_policy_data_free(data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_tree;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -239,7 +253,8 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_O=
F(X509) *certs,<br>
+=C2=A0 * Return value: 1 on success, 0 otherwise<br>
+=C2=A0 */<br>
+ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 X509_POLICY_DATA *data=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 X509_POLICY_DATA *data=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 X509_POLICY_TREE *tree=
)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0X509_POLICY_LEVEL *last =3D curr - 1;<br>
+=C2=A0 =C2=A0 =C2=A0int i, matched =3D 0;<br>
+@@ -249,13 +264,13 @@ static int tree_link_matching_nodes(X509_POLICY_LEVE=
L *curr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X509_POLICY_NODE *node =3D sk_X509_POLIC=
Y_NODE_value(last-&gt;nodes, i);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ossl_policy_node_match(last, node, d=
ata-&gt;valid_policy)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ossl_policy_level_add_node(=
curr, data, node, NULL) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ossl_policy_level_add_node(=
curr, data, node, tree, 0) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matched =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0if (!matched &amp;&amp; last-&gt;anyPolicy) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ossl_policy_level_add_node(curr, data, la=
st-&gt;anyPolicy, NULL) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ossl_policy_level_add_node(curr, data, la=
st-&gt;anyPolicy, tree, 0) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -268,7 +283,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL =
*curr,<br>
+=C2=A0 * Return value: 1 on success, 0 otherwise.<br>
+=C2=A0 */<br>
+ static int tree_link_nodes(X509_POLICY_LEVEL *curr,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const X509_POLICY_CACHE *cache)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const X509_POLICY_CACHE *cache,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0X509_POLICY_TREE *tree)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0int i;<br>
+ <br>
+@@ -276,7 +292,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X509_POLICY_DATA *data =3D sk_X509_POLIC=
Y_DATA_value(cache-&gt;data, i);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Look for matching nodes in previous l=
evel */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tree_link_matching_nodes(curr, data))<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tree_link_matching_nodes(curr, data, tre=
e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -307,7 +323,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *curr,=
<br>
+=C2=A0 =C2=A0 =C2=A0/* Curr may not have anyPolicy */<br>
+=C2=A0 =C2=A0 =C2=A0data-&gt;qualifier_set =3D cache-&gt;anyPolicy-&gt;qua=
lifier_set;<br>
+=C2=A0 =C2=A0 =C2=A0data-&gt;flags |=3D POLICY_DATA_FLAG_SHARED_QUALIFIERS=
;<br>
+-=C2=A0 =C2=A0 if (ossl_policy_level_add_node(curr, data, node, tree) =3D=
=3D NULL) {<br>
++=C2=A0 =C2=A0 if (ossl_policy_level_add_node(curr, data, node, tree, 1) =
=3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ossl_policy_data_free(data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -370,7 +386,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,<br>
+=C2=A0 =C2=A0 =C2=A0/* Finally add link to anyPolicy */<br>
+=C2=A0 =C2=A0 =C2=A0if (last-&gt;anyPolicy &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ossl_policy_level_add_node=
(curr, cache-&gt;anyPolicy,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last-&gt;=
anyPolicy, NULL) =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last-&gt;=
anyPolicy, tree, 0) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+@@ -553,7 +569,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE *t=
ree,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra-&gt;flags =3D POLICY=
_DATA_FLAG_SHARED_QUALIFIERS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| POLICY_DAT=
A_FLAG_EXTRA_NODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D ossl_policy_level=
_add_node(NULL, extra, anyPolicy-&gt;parent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tree);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tree, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tree-&gt;user_policies) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tree-&gt;user_policies =3D=
 sk_X509_POLICY_NODE_new_null();<br>
+@@ -580,7 +596,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; tree-&gt;nlevel; i++, curr++) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D ossl_policy_cache_set(curr-&gt=
;cert);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tree_link_nodes(curr, cache))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tree_link_nodes(curr, cache, tree))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return X509_PCY_TREE_INTER=
NAL;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(curr-&gt;flags &amp; X509_V_FLAG_I=
NHIBIT_ANY)<br>
+-- <br>
+2.35.7<br>
+<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
0.8.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.0.8.bb</a><br>
index 75f9e44748..92e460b1ba 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.8.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/sourc=
e/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-buildinfo-strip-sysro=
ot-and-debug-prefix-map-from-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://afalg.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-twea=
k-mips-cflags.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-0464.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179027): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179027" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179027</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97820339/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97820339/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000051e47905f7a6915b--

